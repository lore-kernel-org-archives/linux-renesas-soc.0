Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: "Zhang, Rui" <rui.zhang@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "edubezval@gmail.com" <edubezval@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
	"cm-hiep@jinso.co.jp" <cm-hiep@jinso.co.jp>,
	PhucBui <bd-phuc@jinso.co.jp>
Subject: RE: [PATCH][RESEND] thermal: hwmon: EXPORT_SYMBOL_GPL for thermal
 hwmon sysfs
Date: Wed, 10 Aug 2016 02:46:23 +0000
Message-ID: <744357E9AAD1214791ACBA4B0B9092633AAA3F54@SHSMSX101.ccr.corp.intel.com>
References: <874m7mlzto.wl%kuninori.morimoto.gx@renesas.com>
	<87a8gu8vqf.wl%kuninori.morimoto.gx@renesas.com>
 <8760r9idot.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8760r9idot.wl%kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> -----Original Message-----
> From: Kuninori Morimoto [mailto:kuninori.morimoto.gx@renesas.com]
> Sent: Wednesday, August 10, 2016 10:10 AM
> To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Zhang, Rui <rui.zhang@intel.com>; edubezval@gmail.com; Geert
> Uytterhoeven <geert@linux-m68k.org>; linux-kernel@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; linux-pm@vger.kernel.org;
> yoshihiro.shimoda.uh@renesas.com; cm-hiep@jinso.co.jp; PhucBui <bd-
> phuc@jinso.co.jp>
> Subject: Re: [PATCH][RESEND] thermal: hwmon: EXPORT_SYMBOL_GPL for
> thermal hwmon sysfs
> Importance: High
> 
> 
> Hi Linux-PM, Linux-Kernel ML
> 
> I posted thermal driver patch 2month ago, but no response and nothing
> happen.
> I'm following scripts/get_maintainer.pl, but am I wrong ??
> Who is the maintainer of these patches ??
> 
The patch is queued for 4.8-rc2.
As you can see at https://git.kernel.org/cgit/linux/kernel/git/rzhang/linux.git/log/?h=next

Thanks,
Rui

> > Hi Zhang
> >
> > ping ??
> >
> > > These are resend patches for rcar-thermal hwmon.
> > >
> > > Kuninori Morimoto (2):
> > >       thermal: rcar-thermal: enable hwmon when thermal_zone
> > >       thermal: hwmon: EXPORT_SYMBOL_GPL for thermal hwmon sysfs
> > >
> > >  drivers/thermal/rcar_thermal.c  | 20 ++++++++++++++++++--
> > > drivers/thermal/thermal_hwmon.c |  2 ++
> > >  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> 
> Best regards
> ---
> Kuninori Morimoto
