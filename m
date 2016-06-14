Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:16586 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751191AbcFNGcU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 02:32:20 -0400
Message-ID: <1465885934.4001.4.camel@intel.com>
Subject: Re: lm-senser can't detect thermal on thermal_zone
From: Zhang Rui <rui.zhang@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "edubezval@gmail.com" <edubezval@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
	"cm-hiep@jinso.co.jp" <cm-hiep@jinso.co.jp>
Date: Tue, 14 Jun 2016 14:32:14 +0800
In-Reply-To: <87oa7bkqvl.wl%kuninori.morimoto.gx@renesas.com>
References: <87posrn1oj.wl%kuninori.morimoto.gx@renesas.com>
	 <1463100287.15071.8.camel@rzhang1-mobl4>
	 <874ma2lnvw.wl%kuninori.morimoto.gx@renesas.com>
	 <87zir89iai.wl%kuninori.morimoto.gx@renesas.com>
	 <87oa7bkqvl.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 2016-06-09 at 03:07 +0000, Kuninori Morimoto wrote:
> 
> Hi Zhang
> 
> Can you check this email ?
> 
> > 
> > > 
> > > Thank you for your help
> > > 
> > > > 
> > > > > 
> > > > > 	non thermal-zon
> > > > > 	  sensor command: OK
> > > > > 	  read from /sys/class/thermal/thermal_zone0 : OK
> > > > > 
> > > > > 	thermal-zon
> > > > > 	  sensor command: NG
> > > > > 	  read from /sys/class/thermal/thermal_zone0 : OK
> > > > config THERMAL_HWMON
> > > >         bool
> > > >         prompt "Expose thermal sensors as hwmon device"
> > > >         depends on HWMON=y || HWMON=THERMAL
> > > >         default y
> > > > 
> > > > please check if the thermal subsystem is built in, while hwmon
> > > > subsystem
> > > > is built as module.
> > > > you should either set CONFIG_HWMON=y, or set both CONFIG_HWMON
> > > > and
> > > > CONFIG_THERMAL as module.
> > > Thanks. but it seems our system has it.
> > > 
> > > I noticed that thermal_zone case uses of_parse_thermal_zones()
> > > and it has this.
> > > 
> > > 		/* No hwmon because there might be hwmon drivers
> > > registering */
> > > 		tzp->no_hwmon = true;
> > > 
> > > and on thermal_zone_device_register() check this for hwmon
> > > 
> > > struct thermal_zone_device *thermal_zone_device_register(xxxx)
> > > {
> > > 	...
> > > 	if (!tz->tzp || !tz->tzp->no_hwmon) {
> > > 		result = thermal_add_hwmon_sysfs(tz);
> > > 		...
> > > 	}
> > > 	...
> > > }
> > > 
> > > Does this mean "thermal_zone doesn't use lm-senser" ?

I'd prefer to say of_thermal registered thermal_zone doesn't use lm-
sensor.
If you're really want to see hwmon interface, I think you should use
thermal API (thermal_zone_device_register) directly.

thanks,
rui
