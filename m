Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 13 Mar 2017 12:01:40 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [i2c-tools PATCH v2] i2ctransfer: add new tool
Message-ID: <20170313110140.GA2476@tetsubishi>
References: <20170306142931.10457-1-wsa@the-dreams.de>
 <20170306195038.6d6a5y5luyuuy7jv@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170306195038.6d6a5y5luyuuy7jv@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uwe,

thanks for the review!

> > +.RI [ data ]
> > +.RI [ desc
> > +.RI [ data ]]
> 
> You could join the previous two lines.

Try it. You will miss some spaces, then.

> > +Also, you cannot be interrupted by another I2C master during one transfer, but it might happen between multiple transfers.
> 
> Well, unless you loose arbitration. Maybe this is too picky to be
> relevant here?

I wonder: will another I2C master start a transfer on a repeated start?
Need to investigate.

> Also in single-master setups you can be interrupted if a driver chooses
> to start sending a transfer between two of yours. I think this is the
> more relevant reason you want to use a single transfer.

Yes, true. I updated the paragraph.

> > +	if (!(funcs & I2C_FUNC_I2C)) {
> > +		fprintf(stderr, MISSING_FUNC_FMT, "I2C transfers");
> > +		return -1;
> > +	}
> 
> Do you need this check? I hope the kernel doesn't rely on userspace to
> not send a transfer the adapter doesn't support? If the kernel checks
> appropriatly it's a waste of time to duplicate the check in i2ctransfer?

Other I2C tools do it also, so I did as well for consistency reasons. I'd
think, if we fix it, we do it altogether on all tools. In a seperate
series.

> > +	fprintf(stderr, "WARNING! This program can confuse your I2C bus, cause data loss and worse!\n");
> 
> Does it kill kittens? :-)

I hope not! :) Again, I copied this line from other I2C tools.

> > +	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
> 
> Should this limit be described in the man page?

Good idea, done now.

> > +			switch (*arg_ptr++) {
> > +			case 'r': flags |= I2C_M_RD; break;
> 
> This doesn't match kernel coding style and I'd put it on separate lines.

It's i2c-tools coding style ;)

> > +	exit(0);
> 
> return EXIT_SUCCESS; ?

Maybe. I'd vote for a seperate series for that again, though.

> > +	for (i = 0; i <= nmsgs; i++)
> > +		free(msgs[i].buf);
> > +
> > +	exit(1);
> 
> return EXIT_FAILURE; ?
> 
> Apart from the exit code this is exactly the trailer of the good path,
> so these could share code.

No! One has '< nmsgs', the other one '<= nmsgs'. Friendly rant: It was
all easier and less subtle before Jean wanted the 'don't rely on the OS
for cleanup' additions ;)

Regards,

   Wolfram
