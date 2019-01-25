Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A81DC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3664E218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 14:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="A8fU77bP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfAYOpG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 09:45:06 -0500
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:47995
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728579AbfAYOpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 09:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agJCQF2kNR19HnwQk3xe+yAJysWflzf7MaMsNzP2PDI=;
 b=A8fU77bP4QHS6r9PSj+Luq5NJixZqLoc87TAZSs3+TYevHUdgRdnLz6i1IwmvidD0zLIdjc+SNb9ARpePVMWCpi2+UylRZ3rNqEoOR4GYYi48RlsAwiNVmf6/RVMUKitHqp8MWlJCWUj/bpA0PBtUhimqEQKxGNn8Q38Bk9nTI8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB1975.jpnprd01.prod.outlook.com (52.134.240.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.19; Fri, 25 Jan 2019 14:44:57 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.021; Fri, 25 Jan 2019
 14:44:57 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Vincent Guittot <vincent.guittot@linaro.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Samuel Holland <samuel@sholland.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Thread-Topic: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Thread-Index: AQHUbQZ8TtZTW3QcxUq23D537RtyIaW+wYkAgAGiYjCAABHU8IAAHm4AgAAE6cCAAAOikA==
Date:   Fri, 25 Jan 2019 14:44:57 +0000
Message-ID: <OSBPR01MB21035AD5A7D94E2D0A1A9189B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
 <OSBPR01MB21034B1D07C9BA05859AEA73B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB210397F6201DBAC36BFB0CB2B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190125140606.GA17196@linaro.org>
 <OSBPR01MB2103AFD4C1E401F26963EA31B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103AFD4C1E401F26963EA31B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1975;20:d9Mz56Tlq3uNFR5QR+fNdEyUOr0GW/X+WV0Reegn33QrLVfHqZ0LRANhYniEbyaKL3nHdaiSmc1WjhWren68LmdLC804/ck5pwch95VrWnyRSuxy19EryEtb/3x/HlMQMAB8KTLXR80u+w8LCwD2wE7YkQj/q78OPSzaau771+Y=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 498dd066-ce42-482b-e5c2-08d682d3ad3d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1975;
x-ms-traffictypediagnostic: OSBPR01MB1975:
x-microsoft-antispam-prvs: <OSBPR01MB197511597873ED1C10F29247B89B0@OSBPR01MB1975.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39860400002)(53754006)(51914003)(199004)(189003)(13464003)(97736004)(25786009)(33656002)(44832011)(99286004)(30864003)(966005)(102836004)(6506007)(53546011)(66066001)(478600001)(14454004)(93886005)(53936002)(66574012)(4326008)(6246003)(39060400002)(2940100002)(7416002)(305945005)(105586002)(54906003)(186003)(86362001)(446003)(26005)(316002)(2906002)(7736002)(68736007)(8936002)(476003)(106356001)(11346002)(486006)(8676002)(71190400001)(93156006)(3846002)(81156014)(9686003)(81166006)(53946003)(7696005)(55016002)(76176011)(6306002)(71200400001)(6116002)(74316002)(6916009)(229853002)(256004)(14444005)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1975;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qXxGJnUSxq62NRVMr2Qas5RxtBmsJG9FUTO75HE9ftAeknRVLhPT409Ixqq+SM0pg1YSvLOPnpS4Av8ymxuc9aYRU0qXAcuh2Z0ZQdknmL3oM4B4ZsPy68svBtBhYhW1ZyAbhhP+lgKd4HAVCvzocLiQrJUswoA0+ODPVB3hKAba2QHVIbqhBgYjG0H0Kn4MmrOWzrXuPWPnJlgjIPPI58Ghro+8UIMcuBhbd15cPWP9BeIj7MddTgJfXEE30fsNd9d9UnNsgOucHg5b5Pjf1BLtUevEYDryevWaRGRiFxTqnBnJIIhfE/ZmoXbyHrzVRf5aqFSMnldkr1OoguX84Zih6AdNCpEsqhqeP5+VDDuOqCLN8uXQ71DiJJf9BkYHldbHT2XCyPsfLPsYzado+m9VDRQihLaH2U2eIbthMps=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498dd066-ce42-482b-e5c2-08d682d3ad3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 14:44:57.3541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1975
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vincent,

The below patch fixed deadlock.

--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -105,7 +105,7 @@ static inline bool pm_runtime_callbacks_present(struct =
device *dev)

 static inline void pm_runtime_mark_last_busy(struct device *dev)
 {
-       WRITE_ONCE(dev->power.last_busy, ktime_to_ns(ktime_get()));
+       WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
 }

Regards,
Biju
> -----Original Message-----
> From: Biju Das
> Sent: 25 January 2019 14:26
> To: 'Vincent Guittot' <vincent.guittot@linaro.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>; Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Simon
> Horman <horms@verge.net.au>; Magnus Damm
> <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-
> soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE
> TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; John
> Stultz <john.stultz@linaro.org>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; Samuel Holland <samuel@sholland.org>
> Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
>
> Hi Vincent,
>
> Thanks for the update. I am still seeing the same deadlock.
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index fb5e2b6..a96641a 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -155,7 +155,7 @@ u64 pm_runtime_autosuspend_expiration(struct
> device *dev)
>
>         expires  =3D READ_ONCE(dev->power.last_busy);
>         expires +=3D (u64)autosuspend_delay * NSEC_PER_MSEC;
> -       if (expires > ktime_to_ns(ktime_get()))
> +       if (expires > ktime_get_mono_fast_ns())
>                 return expires; /* Expires in the future */
>
>         return 0;
> @@ -921,7 +921,7 @@ static enum hrtimer_restart
> pm_suspend_timer_fn(struct hrtimer *timer)
>          * If 'expires' is after the current time, we've been called
>          * too early.
>          */
> -       if (expires > 0 && expires < ktime_to_ns(ktime_get())) {
> +       if (expires > 0 && expires < ktime_get_mono_fast_ns()) {
>                 dev->power.timer_expires =3D 0;
>                 rpm_suspend(dev, dev->power.timer_autosuspends ?
>                     (RPM_ASYNC | RPM_AUTO) : RPM_ASYNC); @@ -940,7 +940,7
> @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct hrtimer
> *timer)  int pm_schedule_suspend(struct device *dev, unsigned int delay) =
 {
>         unsigned long flags;
> -       ktime_t expires;
> +       u64 expires;
>         int retval;
>
>         spin_lock_irqsave(&dev->power.lock, flags); @@ -957,8 +957,8 @@ i=
nt
> pm_schedule_suspend(struct device *dev, unsigned int delay)
>         /* Other scheduled or pending requests need to be canceled. */
>         pm_runtime_cancel_pending(dev);
>
> -       expires =3D ktime_add(ktime_get(), ms_to_ktime(delay));
> -       dev->power.timer_expires =3D ktime_to_ns(expires);
> +       expires =3D ktime_get_mono_fast_ns() + ((u64)delay *
> NSEC_PER_MSEC);
> +       dev->power.timer_expires =3D expires;
>         dev->power.timer_autosuspends =3D 0;
>         hrtimer_start(&dev->power.suspend_timer, expires,
> HRTIMER_MODE_ABS);
>
>
> please find the logs.
>
> root@salvator-x:~# echo  e60f0000.timer >
> /sys/devices/system/clocksource/clocksource0/current_clocksource
> [   42.769260]
> [   42.770760] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   42.776068] WARNING: possible recursive locking detected
> [   42.781378] 5.0.0-rc3-next-20190125-00001-gfa6709c-dirty #33 Not taint=
ed
> [   42.788076] --------------------------------------------
> [   42.793385] migration/0/11 is trying to acquire lock:
> [   42.798435] 00000000b43b7183 (tk_core.seq){----}, at:
> rpm_resume+0x5f0/0x7a8
> [   42.805497]
> [   42.805497] but task is already holding lock:
> [   42.811326] 00000000b43b7183 (tk_core.seq){----}, at:
> multi_cpu_stop+0x8c/0x140
> [   42.818641]
> [   42.818641] other info that might help us debug this:
> [   42.825165]  Possible unsafe locking scenario:
> [   42.825165]
> [   42.831080]        CPU0
> [   42.833521]        ----
> [   42.835962]   lock(tk_core.seq);
> [   42.839185]   lock(tk_core.seq);
> [   42.842409]
> [   42.842409]  *** DEADLOCK ***
> [   42.842409]
> [   42.848328]  May be due to missing lock nesting notation
> [   42.848328]
> [   42.855115] 4 locks held by migration/0/11:
> [   42.859293]  #0: 00000000a7511731 (timekeeper_lock){-.-.}, at:
> change_clocksource+0x2c/0x118
> [   42.867738]  #1: 00000000b43b7183 (tk_core.seq){----}, at:
> multi_cpu_stop+0x8c/0x140
> [   42.875484]  #2: 00000000b54c38a2 (&ch->lock){....}, at:
> sh_cmt_start+0x28/0x200
> [   42.882887]  #3: 0000000010d14eec (&(&dev->power.lock)->rlock){-...}, =
at:
> __rpm_callback+0xbc/0x1e8
> [   42.891937]
> [   42.891937] stack backtrace:
> [   42.896294] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.0.0-rc3-nex=
t-
> 20190125-00001-gfa6709c-dirty #33
> [   42.905860] Hardware name: Renesas Salvator-X 2nd version board based
> on r8a7796 (DT)
> [   42.913689] Call trace:
> [   42.916137]  dump_backtrace+0x0/0x178
> [   42.919796]  show_stack+0x14/0x20
> [   42.923111]  dump_stack+0xb0/0xec
> [   42.926425]  __lock_acquire+0xfb4/0x1c08
> [   42.930345]  lock_acquire+0xd0/0x268
> [   42.933917]  ktime_get+0x5c/0x108
> [   42.937229]  rpm_resume+0x5f0/0x7a8
> [   42.940714]  __pm_runtime_resume+0x50/0x98
> [   42.944807]  sh_cmt_start+0x84/0x200
> [   42.948380]  sh_cmt_clocksource_enable+0x28/0x48
> [   42.952995]  change_clocksource+0x84/0x118
> [   42.957087]  multi_cpu_stop+0x8c/0x140
> [   42.960834]  cpu_stopper_thread+0xac/0x120
> [   42.964931]  smpboot_thread_fn+0x1ac/0x2c8
> [   42.969024]  kthread+0x12c/0x130
> [   42.972249]  ret_from_fork+0x10/0x18
>
> Regards,
> Biju
>
> > -----Original Message-----
> > From: Vincent Guittot <vincent.guittot@linaro.org>
> > Sent: 25 January 2019 14:06
> > Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device
> > nodes
> >
> > Hi Biju,
> >
> > It seems that the call of mark_last_busy in rpm_resume raises this
> problem.
> > We have the sequence:
> > change_clocksource
> >
> >     write_seqcount_begin
> >     ...
> >     timekeeping_update
> >         ...
> >         sh_cmt_clocksource_enable
> >             ...
> >             rpm_resume
> >                 pm_runtime_mark_last_busy
> >                     ktime_get
> >                         do
> >                             read_seqcount_begin
> >                         while read_seqcount_retry
> >     ....
> >     write_seqcount_end
> >
> > In fact, we should be safe because we haven't yet changed the
> > clocksource as we are enabling the clocksource that will be used for th=
e
> switch.
> >
> > Can you try the patch below ?
> > It uses ktime_get_mono_fast_ns instead which is lock safe for such
> > case
> >
> > ---
> >  drivers/base/power/runtime.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/base/power/runtime.c
> > b/drivers/base/power/runtime.c index 457be03..708a13f 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -130,7 +130,7 @@ u64 pm_runtime_autosuspend_expiration(struct
> > device *dev)  {
> >  int autosuspend_delay;
> >  u64 last_busy, expires =3D 0;
> > -u64 now =3D ktime_to_ns(ktime_get());
> > +u64 now =3D ktime_get_mono_fast_ns();
> >
> >  if (!dev->power.use_autosuspend)
> >  goto out;
> > @@ -909,7 +909,7 @@ static enum hrtimer_restart
> > pm_suspend_timer_fn(struct hrtimer *timer)
> >   * If 'expires' is after the current time, we've been called
> >   * too early.
> >   */
> > -if (expires > 0 && expires < ktime_to_ns(ktime_get())) {
> > +if (expires > 0 && expires < ktime_get_mono_fast_ns()) {
> >  dev->power.timer_expires =3D 0;
> >  rpm_suspend(dev, dev->power.timer_autosuspends ?
> >      (RPM_ASYNC | RPM_AUTO) : RPM_ASYNC); @@ -928,7
> > +928,7 @@ static enum hrtimer_restart  pm_suspend_timer_fn(struct
> > hrtimer *timer)  int pm_schedule_suspend(struct device *dev, unsigned
> > int
> > delay)  {
> >  unsigned long flags;
> > -ktime_t expires;
> > +u64 expires;
> >  int retval;
> >
> >  spin_lock_irqsave(&dev->power.lock, flags); @@ -945,8 +945,8 @@
> int
> > pm_schedule_suspend(struct device *dev, unsigned int delay)
> >  /* Other scheduled or pending requests need to be canceled. */
> >  pm_runtime_cancel_pending(dev);
> >
> > -expires =3D ktime_add(ktime_get(), ms_to_ktime(delay));
> > -dev->power.timer_expires =3D ktime_to_ns(expires);
> > +expires =3D ktime_get_mono_fast_ns() + (u64)delay *
> > NSEC_PER_MSEC);
> > +dev->power.timer_expires =3D expires;
> >  dev->power.timer_autosuspends =3D 0;
> >  hrtimer_start(&dev->power.suspend_timer, expires,
> HRTIMER_MODE_ABS);
> >
> > --
> > 2.7.4
> >
> > Le Friday 25 Jan 2019 =E0 12:26:54 (+0000), Biju Das a =E9crit :
> > > Hi All,
> > >
> > > I have enabled lock debugging  and it is showing "possible recursive
> > > locking
> > detected "with the patch ("8234f6734c5d74ac794e5517437f51c57d65f865"
> > PM-runtime: Switch autosuspend over to using hrtimers)
> > >
> > > root@salvator-x:~# echo  e60f0000.timer >
> > /sys/devices/system/clocksource/clocksource0/current_clocksource
> > > [   67.995854]
> > > [   67.997354] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > [   68.002663] WARNING: possible recursive locking detected
> > > [   68.007974] 5.0.0-rc3-next-20190125-00005-g382822b #31 Not tainted
> > > [   68.014150] --------------------------------------------
> > > [   68.019459] migration/0/11 is trying to acquire lock:
> > > [   68.024509] 0000000065de5fdf (tk_core.seq){----}, at:
> > rpm_resume+0x5f0/0x7a8
> > > [   68.031570]
> > > [   68.031570] but task is already holding lock:
> > > [   68.037399] 0000000065de5fdf (tk_core.seq){----}, at:
> > multi_cpu_stop+0x8c/0x140
> > > [   68.044714]
> > > [   68.044714] other info that might help us debug this:
> > > [   68.051237]  Possible unsafe locking scenario:
> > > [   68.051237]
> > > [   68.057153]        CPU0
> > > [   68.059594]        ----
> > > [   68.062034]   lock(tk_core.seq);
> > > [   68.065258]   lock(tk_core.seq);
> > > [   68.068482]
> > > [   68.068482]  *** DEADLOCK ***
> > > [   68.068482]
> > > [   68.074402]  May be due to missing lock nesting notation
> > > [   68.074402]
> > > [   68.081188] 4 locks held by migration/0/11:
> > > [   68.085366]  #0: 00000000463b6446 (timekeeper_lock){-.-.}, at:
> > change_clocksource+0x2c/0x118
> > > [   68.093812]  #1: 0000000065de5fdf (tk_core.seq){----}, at:
> > multi_cpu_stop+0x8c/0x140
> > > [   68.101558]  #2: 0000000098b45550 (&ch->lock){....}, at:
> > sh_cmt_start+0x28/0x200
> > > [   68.108961]  #3: 00000000da0f4e80 (&(&dev->power.lock)->rlock){-..=
.},
> at:
> > __rpm_callback+0xbc/0x1e8
> > > [   68.118011]
> > > [   68.118011] stack backtrace:
> > > [   68.122368] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.0.0-rc3=
-
> next-
> > 20190125-00005-g382822b #31
> > > [   68.131412] Hardware name: Renesas Salvator-X 2nd version board
> based
> > on r8a7796 (DT)
> > > [   68.139240] Call trace:
> > > [   68.141687]  dump_backtrace+0x0/0x178
> > > [   68.145346]  show_stack+0x14/0x20
> > > [   68.148661]  dump_stack+0xb0/0xec
> > > [   68.151975]  __lock_acquire+0xfb4/0x1c08
> > > [   68.155894]  lock_acquire+0xd0/0x268
> > > [   68.159467]  ktime_get+0x5c/0x108
> > > [   68.162779]  rpm_resume+0x5f0/0x7a8
> > > [   68.166265]  __pm_runtime_resume+0x50/0x98
> > > [   68.170358]  sh_cmt_start+0x84/0x200
> > > [   68.173931]  sh_cmt_clocksource_enable+0x28/0x48
> > > [   68.178546]  change_clocksource+0x84/0x118
> > > [   68.182639]  multi_cpu_stop+0x8c/0x140
> > > [   68.186385]  cpu_stopper_thread+0xac/0x120
> > > [   68.190481]  smpboot_thread_fn+0x1ac/0x2c8
> > > [   68.194574]  kthread+0x12c/0x130
> > > [   68.197800]  ret_from_fork+0x10/0x18
> > >
> > > Regards,
> > > Biju
> > >
> > > > -----Original Message-----
> > > > From: Biju Das
> > > > Sent: 25 January 2019 11:27
> > > > To: 'Geert Uytterhoeven' <geert@linux-m68k.org>; Vincent Guittot
> > > > <vincent.guittot@linaro.org>; Sergei Shtylyov
> > > > <sergei.shtylyov@cogentembedded.com>
> > > > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > > > <mark.rutland@arm.com>; Simon Horman <horms@verge.net.au>;
> > Magnus
> > > > Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-
> > > > soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE
> > > > TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > > > <geert+renesas@glider.be>; Chris Paterson
> > > > <Chris.Paterson2@renesas.com>; Daniel Lezcano
> > > > <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>;
> > > > John Stultz <john.stultz@linaro.org>; Fabrizio Castro
> > > > <fabrizio.castro@bp.renesas.com>; Samuel Holland
> > > > <samuel@sholland.org>
> > > > Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device
> > > > nodes
> > > >
> > > > Hi Geert,
> > > >
> > > > Thanks for the feedback. I started testing CMT on latest
> > > > kernel(Linux-next-
> > > > 20190125 and also renesas-dev) and found that it is broken on
> > > > R-Car M3-W device.
> > > >
> > > > On further investigation the patch ("
> > > > 8234f6734c5d74ac794e5517437f51c57d65f865"   PM-runtime: Switch
> > > > autosuspend over to using hrtimers)  is causing the issue.
> > > >
> > > > During clock source switching, It calls the function "sh_cmt_enable=
"
> > > > which calls " pm_runtime_get_sync(&ch->cmt->pdev->dev);"  and
> > > > after that console freezes.
> > > >
> > > > Sergei: Have you noticed this issue  on R-Car V3M and V3H boards
> > > > with latest kernel?
> > > >
> > > > Regards,
> > > > Biju
> > > >
> > > > > -----Original Message-----
> > > > > From: linux-renesas-soc-owner@vger.kernel.org
> > > > > <linux-renesas-soc- owner@vger.kernel.org> On Behalf Of Geert
> > > > > Uytterhoeven
> > > > > Sent: 24 January 2019 10:16
> > > > > To: Biju Das <biju.das@bp.renesas.com>
> > > > > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > > > > <mark.rutland@arm.com>; Simon Horman <horms@verge.net.au>;
> > > > Magnus Damm
> > > > > <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-
> > > > > soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE
> > > > > TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > > > > <geert+renesas@glider.be>; Chris Paterson
> > > > > <Chris.Paterson2@renesas.com>; Daniel Lezcano
> > > > > <daniel.lezcano@linaro.org>; Thomas Gleixner
> > > > > <tglx@linutronix.de>; John Stultz <john.stultz@linaro.org>;
> > > > > Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Samuel Holland
> > > > <samuel@sholland.org>
> > > > > Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT
> > > > > device nodes
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > On Fri, Oct 26, 2018 at 10:32 AM Biju Das
> > > > > <biju.das@bp.renesas.com>
> > > > wrote:
> > > > > > This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > > > ---
> > > > > > This patch is tested against renesas-dev
> > > > > >
> > > > > > I have executed on inconsistency-check, nanosleep and
> > > > > > clocksource_switch selftests on this arm64 SoC. The
> > > > > > inconsistency-check and nanosleep tests are working fine.The
> > > > > > clocksource_switch asynchronous test is failing due to
> > > > > > inconsistency-check
> > > > > failure on "arch_sys_counter".
> > > > > >
> > > > > > But if i skip the clocksource_switching of "arch_sys_counter",
> > > > > > the asynchronous test is passing for CMT0/1/2/3 timer.
> > > > > >
> > > > > > Has any one noticed this issue?
> > > > >
> > > > > clockevents/next now has commit 7cd6dca3600d8d71
> > > > > ("clocksource/drivers/arch_timer: Workaround for Allwinner A64
> > > > > timer instability").  Perhaps this is related, and the same test
> > > > > program may indicate similar issues?
> > > > >
> > > > > See also https://lore.kernel.org/lkml/20190113021719.46457-2-
> > > > > samuel@sholland.org/
> > > > >
> > > > > Gr{oetje,eeting}s,
> > > > >
> > > > >                         Geert
> > > > >
> > > > > --
> > > > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > > > geert@linux- m68k.org
> > > > >
> > > > > In personal conversations with technical people, I call myself a
> > > > > hacker. But when I'm talking to journalists I just say
> > > > > "programmer" or
> > > > something like that.
> > > > >                                 -- Linus Torvalds
> > >
> > >
> > >
> > > Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne
> > End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under
> > Registered No. 04586709.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
