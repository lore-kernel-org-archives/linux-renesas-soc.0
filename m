Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49363 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1751893AbdASUPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 15:15:44 -0500
Date: Thu, 19 Jan 2017 21:14:52 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] watchdog: softdog: make pretimeout support a compile
 option
Message-ID: <20170119201452.hv3zkmlhiz7rzb44@ninjato>
References: <20170106084144.22324-1-wsa+renesas@sang-engineering.com>
 <20170110175840.GB13904@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20170110175840.GB13904@roeck-us.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> > +#if IS_ENABLED(CONFIG_SOFT_WATCHDOG_PRETIMEOUT)
> >  static void softdog_pretimeout(unsigned long data)
> 
> I would prefer __maybe_unused here ..
> 
> >  {
> >  	watchdog_notify_pretimeout(&softdog_dev);
> > @@ -82,16 +83,23 @@ static void softdog_pretimeout(unsigned long data)
> >  static struct timer_list softdog_preticktock =
> >  		TIMER_INITIALIZER(softdog_pretimeout, 0, 0);
> >  
> > +static struct timer_list *softdog_preticktock_ptr = &softdog_preticktock;
> > +#else
> > +static void *softdog_preticktock_ptr = NULL;
> > +#endif /* CONFIG_SOFT_WATCHDOG_PRETIMEOUT */
> > +
> >  static int softdog_ping(struct watchdog_device *w)
> >  {
> >  	if (!mod_timer(&softdog_ticktock, jiffies + (w->timeout * HZ)))
> >  		__module_get(THIS_MODULE);
> >  
> > -	if (w->pretimeout)
> > -		mod_timer(&softdog_preticktock, jiffies +
> > -			  (w->timeout - w->pretimeout) * HZ);
> > -	else
> > -		del_timer(&softdog_preticktock);
> > +	if (softdog_preticktock_ptr) {
> 
> and "if (IS_ENABLED(CONFIG_SOFT_WATCHDOG_PRETIMEOUT))" here.
> 
> > +		if (w->pretimeout)
> > +			mod_timer(softdog_preticktock_ptr, jiffies +
> > +				  (w->timeout - w->pretimeout) * HZ);
> > +		else
> > +			del_timer(softdog_preticktock_ptr);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -101,15 +109,15 @@ static int softdog_stop(struct watchdog_device *w)
> >  	if (del_timer(&softdog_ticktock))
> >  		module_put(THIS_MODULE);
> >  
> > -	del_timer(&softdog_preticktock);
> > +	if (softdog_preticktock_ptr)
> 
> Is this conditional needed (assuming we get rid of softdog_preticktock_ptr) ?
> Ok though if you want to use it to drop the code if not needed.

Yes. I tried a few variations and this is the outcome which I liked
best, because it is quite readable, keeps all the extra stuff within one
block and has 0 size penalty when the feature is not enabled.

I'd like to keep it this way unless you have a strong opinion.
