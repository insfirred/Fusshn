import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const RESEND_API_KEY = 're_1A24eQ5Q_HpNetzA9DH6wBdk3KLaYnmsd';

const handler = async (_request: Request): Promise<Response> => {
    const requestData = await _request.json();
    const {
        userEmail,
        userName,
        eventName,
        eventDate,
        eventVenue,
        bookingId,
        totalUserAllowed,
        amountPerTicket,
        totalAmount,
    } = requestData;


    const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${RESEND_API_KEY}`
        },
        body: JSON.stringify({
            from: 'Fusshn <tickets@fusshn.in>',
            to: [userEmail],
            subject: 'Booking Confirmation',
            html: `
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Booking Confirmation</title>
                <!-- Importing Poppins font from Google Fonts -->
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
                <style>
                    body {
                        font-family: 'Poppins', sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #333;
                        color: #fff;
                    }
                    .email-container {
                        max-width: 600px;
                        margin: 0 auto;
                        background-color: #444;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    .email-header {
                        text-align: center;
                        padding-bottom: 20px;
                        border-bottom: 2px solid #555;
                    }
                    .email-header h1 {
                        color: rgb(48, 185, 77); /* Fusshn primary color */
                        margin: 0;
                        font-size: 24px; /* Reduced font size for the heading */
                    }
                    .email-header p {
                        font-size: 14px;
                        color: #bbb;
                    }
                    .email-body {
                        padding: 20px;
                    }
                    .email-body h2 {
                        color: #fff;
                    }
                    .event-details {
                        margin: 20px 0;
                    }
                    .event-details p {
                        font-size: 16px;
                        color: #ccc;
                    }
                    .confirmation-code {
                        font-size: 18px;
                        font-weight: bold;
                        color: rgb(48, 185, 77); /* Fusshn primary color */
                    }
                    .email-body p {
                        color: #ddd; /* Light grey for the general text */
                    }
                    .cta-button {
                        display: inline-block;
                        background-color: rgb(48, 185, 77); /* Fusshn primary color */
                        color: white;
                        padding: 10px 20px;
                        font-size: 16px;
                        text-decoration: none;
                        border-radius: 4px;
                        margin-top: 20px;
                    }
                    .cta-button:hover {
                        background-color: #3b9e63; /* Slightly darker shade for hover effect */
                    }
                    .footer {
                        text-align: center;
                        margin-top: 40px;
                        font-size: 12px;
                        color: #bbb;
                    }
                    .footer .company-name {
                        font-weight: bold;
                        color: rgb(48, 185, 77); /* Fusshn primary color */
                    }
                </style>
            </head>
            <body>
                <div class="email-container">
                    <div class="email-header">
                        <h1>Hey ${userName}, Your Booking is Confirmed!</h1>
                        <p>Thank you for booking with Fusshn!</p>
                    </div>
                    <div class="email-body">
                        <h2>Booking Details</h2>
                        <div class="event-details">
                            <p><strong>Event:</strong> <event name here></p>
                            <p><strong>Date:</strong> ${eventDate}</p>
                            <p><strong>Venue:</strong> <event address here></p>
                        </div>
            
                        <p><strong>Your Confirmation Code:</strong> <span class="confirmation-code">${bookingId}</span></p>
                        <p><strong>Total Amount Paid:</strong> ₹${totalAmount}</p>
            
                        <p>If you have any questions, feel free to reach out to our support team.</p>
            
                        <a href="[Event URL]" class="cta-button">View Event Details</a>
                    </div>
                    <div class="footer">
                        <p>For more information, visit our website: <a href="https://fusshn.in" class="company-name">http://fusshn.in</a></p>
                        <p>You're receiving this email because you booked a ticket with <span class="company-name">Fusshn</span>.</p>
                    </div>
                </div>
            </body>
            </html>
`,

        })
    });

    const data = await res.json();

    return new Response(JSON.stringify(data), {
        status: 200,
        headers: {
            'Content-Type': 'application/json',
        },
    });
};

serve(handler);