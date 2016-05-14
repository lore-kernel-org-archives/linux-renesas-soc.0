Return-Path: <devicetree-owner@vger.kernel.org>
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Sat, 14 May 2016 14:12:02 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: add DMA support
Message-ID: <20160514121202.GJ3256@bigcity.dyn.berto.se>
References: <1462365503-8451-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <20160512213127.GA1860@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160512213127.GA1860@katana>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2016-05-12 23:31:27 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> thanks for the submission. I was finally able to test this change.
> 
> On Wed, May 04, 2016 at 02:38:23PM +0200, Niklas S�derlund wrote:
> > Make it possible to transfer i2c message buffers via DMA.
> > Start/Stop/Sending_Slave_Address and some data is still handled using
> > the old state machine, it is sending the bulk of the data that is done
> > via DMA.
> > 
> > The first byte of a transmission and the last two bytes of reception are
> > sent/received using PIO. This is needed for the HW to have access to the
> > first byte before DMA transmit and to be able to set the STOP condition
> > for DMA reception.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> I did regression tests on my Salvator-X trying to trigger previously
> known issues. Nothing bad happened. This could be expected since START
> and STOP is done in PIO mode, but one never knows :) Also did verify
> that DMA is triggered for bigger transfers.
> 
> Did you have time to re-measure the threshold? Also, did you try booting

I did not re-measure the threshold, I'm not sure how to do that in a 
good correct way. I reasoned that I modeled my implementation on the 
sh_mobile-driver and there are roughly the same amount code in the DMA 
code path so I used the same threshold.

> without DMA and on Gen2? We had a bit of hazzle with !DMA with the
> sh_mobile-driver. Boot test and basic i2cdetect will suffice.

I tested in on Koelsch, but I don't have the schematics for the board so 
I could not hookup to an external i2c bus and look at it. But i2cdetect 
is working.

> 
> Patch looks good, only minor nits:
> 
> > +	/* Do not use DMA for messages shorter then 8 bytes */
> > +	if (msg->len < 8)
> > +		return;
> > +
> > +	if (IS_ERR(chan))
> > +		return;
> 
> Make this one if (a || b)?

Fill fix.

> 
> > @@ -516,6 +738,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
> >  out:
> >  	pm_runtime_put(dev);
> >  
> > +
> 
> Unrelated change ;)

Fill fix.

> 
> Thanks,
> 
>    Wolfram
> 

-- 
Regards,
Niklas S�derlund
