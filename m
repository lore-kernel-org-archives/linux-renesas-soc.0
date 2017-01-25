Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 25 Jan 2017 10:56:03 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Message-ID: <20170125095603.GE2021@mai>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com>
 <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai>
 <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 24, 2017 at 08:19:50PM +0000, Chris Brandt wrote:
> Hi Daniel,
> 
> On Tuesday, January 24, 2017, Daniel Lezcano wrote:
> > > > > +early_platform_init("earlytimer", &ostm_timer);
> > > > > +subsys_initcall(ostm_init); module_exit(ostm_exit);
> > > > > +
> > > > > +MODULE_AUTHOR("Chris Brandt");
> > > > > +MODULE_DESCRIPTION("Renesas OSTM Timer Driver");
> > > > > +MODULE_LICENSE("GPL v2");
> > > >
> > > > Maybe you can try with builtin_platform ?
> > >
> > > Good idea. But, now I get a "Section mismatch" during link time so
> > > I'll have to figure out why that is.
> > 
> > Mmh, I think it would be more consistent to convert this to:
> > 
> > CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > 
> > The only problem is to get the struct device associated to the of_node
> > passed as parameter to ostm_init in order to use the devm_* API.
> > 
> > I think of_find_device_by_node should return the platform_device, then
> > pdev->dev. If that works the other drivers will benefit from that to
> > pdev->remove all
> > the rollback code everywhere.
> 
> 
> It was a good idea....but it will not work.
> 
> While CLOCKSOURCE_OF_DECLARE is good at putting the driver at the
> front of the line for loading, it's too early in boot to detect
> a platform_device.
> 
> of_find_device_by_node calls bus_find_device. But the first thing that
> bus_find_device does is:
> 
> 	if (!bus || !bus->p)
> 		return NULL;
> 
> But bus->p=0 so it returns immediately.
> 
> 
> Of course changing the code over to:
>         devm_kzalloc -> devm_kzalloc
> devm_ioremap_nocache -> of_io_request_and_map
>     platform_get_irq -> irq_of_parse_and_map
>              dev_err -> pr_err
> 
> 
> Then things work, but I'm back to managing the rollback code manually.
> 
> 
> Any other ideas on how to get the corresponding platform_device for
> a DT node?

No :/

So up to you.
	- CLOCKSOURCE_OF_DECLARE consistent but need rollback
	or
	- platform_device but with another timer available at early time

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
