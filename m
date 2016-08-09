Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35192 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932238AbcHIJfM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 05:35:12 -0400
Received: by mail-wm0-f47.google.com with SMTP id f65so21575934wmi.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Aug 2016 02:35:11 -0700 (PDT)
Date: Tue, 9 Aug 2016 11:35:08 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	duclm <lm-duc@jinso.co.jp>, wsa@sang-engineering.com,
	ryusuke.sakato.bx@renesas.com, magnus.damm@gmail.com,
	geert+renesas@glider.be,
	=?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
	yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
	cm-hiep@jinso.co.jp, 'Xuan Truong Jinso' <nx-truong@jinso.co.jp>,
	laurent.pinchart+renesas@ideasonboard.com,
	horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org
Subject: Re: The failure summary report of GEN3 for linux stable v4.7
Message-ID: <20160809093508.GC6864@bigcity.dyn.berto.se>
References: <57A94A79.30304@jinso.co.jp>
 <87bn127aiz.wl%kuninori.morimoto.gx@renesas.com>
 <20160809070314.GB6864@bigcity.dyn.berto.se>
 <1547042.76US3mHF9I@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1547042.76US3mHF9I@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016-08-09 11:16:25 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Tuesday 09 Aug 2016 09:03:14 Niklas S�derlund wrote:
> > On 2016-08-09 06:01:48 +0000, Kuninori Morimoto wrote:
> > > Hi duclm
> > > 
> > > > root@linaro-nano:~# cd /sys/bus/platform/drivers/i2c-rcar; find -type l
> > > > ./e6510000.i2c
> > > > root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar# echo e6510000.i2c >
> > > > unbind [   30.505950] clk_unregister: unregistering prepared clock:
> > > > clk_multiplier root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar# ls
> > > > -d e6510000.i2c ls: cannot access e6510000.i2c: No such file or
> > > > directory
> > > > root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar# echo e6510000.i2c >
> > > > bind [   40.825298] cs2000-cp 2-004f: revision - C1
> > > > [   40.829587] i2c-rcar e6510000.i2c: probed
> > > > root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar# ls -d e6510000.i2c
> > > > e6510000.i2c
> > > > root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar#
> > > > root@linaro-nano:/sys/bus/platform/drivers/i2c-rcar# aplay
> > > > /home/board-lager/FSI/data/test.wav> 
> > > Thank you for your report.
> > > This is open (and deep) issue (Oops after "unbind" -> "rebind")
> > > We have similar issue on I2C / ALSA SoC / DMAEngine / V4L2 SoC etc...
> > > and we should care about it, but it is still under discussion I think.
> > > ALSA SoC had started to solve this issue, but it will take over 2 years
> > 
> > FWIW the VIN patches for Gen3 which are posted to ML solves the
> > unbind/bind problem for the rcar-vin driver.
> 
> Given that the driver
> 
> - allocates struct rvin_dev structure with devm_kzalloc
> - embeds struct video_device in rvin_dev
> - sets video_device::release to video_device_release_empty
> 
> I have some doubts about this :-)
> 
> Could you try the following sequence ?
> 
> - Open the video device node and keep it open (yavta --sleep-forever)
> - Unbind the VIN device from the driver
> - Close the video device node

Ohh my bad, I was talking about unbind/bind of V4L2 subdevices while the 
VIN driver would remain functional after such cycle. Yes keeping the 
video node open and unbinding the VIN driver itself would not work.  
Neither will unbind/bind of subdevices if the video node is kept open, 
if it is closed however it is able to recover from its subdevices being 
unbound/bound.

Sorry for the noise.

-- 
Regards,
Niklas S�derlund
