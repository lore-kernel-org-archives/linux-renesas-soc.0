Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BCDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA5B4206BA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uKNuMl/Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfCLMpg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:45:36 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55928 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfCLMpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:45:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id 4so2482173wmf.5;
        Tue, 12 Mar 2019 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZKrq0IhR7vMAne1RYaBLPyVMUsQFOP470W5D26EXvlU=;
        b=uKNuMl/Z4rr7LMxe+YuZel5cMKCXBPztmC/z4vx2i5H4INxiAULHr1nhMeRFGUIkrm
         C63mxBQteojHeu5MIrrxtcVFsSRY5thUAlb4svsYouoZnW2ufwVPzuUAz6FIrXPODXA0
         v4TnmLV9SUzG2f5loet4i3YEyWjc6c4mVCVcy8HNTmdf/Jbch7SwOCL1c/tJbkxY0ZsS
         itYNrJDe9tJuN8g1WSJsEfEIgxP8J+sj1fhTDq0ew6oIEJa1dDdQ7F466BuUc1KeXMIC
         qH790IU9K7juYWWk0KFBCz5/BbSJcnOh9yTnUvJoveh2WVOGcjtXhBvOIjBxwKX/s4jb
         QxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZKrq0IhR7vMAne1RYaBLPyVMUsQFOP470W5D26EXvlU=;
        b=P+tqfoBIMZRxhCqQrf8ZSQTSe7zHxNEULZZRsMwjgjd/ZX7CLC1Xpl8EiIXYtwPjiy
         uUHgNj/w7GskfZSWWHc6/Ov5RH8lWi2C506BfaICabbK3MvOX012/YBT723kAzUKzdMD
         Xx4HjacznJZ7s1hfQg6NvpzXKwRvA/ZVr0mQs4RD9ipAtvSc074DqonAxbqVduGrqOb2
         BeQxbRy2pzaLFgmpxQ9lsY0guGUoDrn47EG72eQOakLy2Xe00D1KMG96rl1HWHu9K64t
         x3+0l+qWT94GZwXsLsGgIxqYU8e5URfskYYFkhZJKHe3/XHVgSVM6fyoVLeYklzv/S64
         XeCA==
X-Gm-Message-State: APjAAAU0AW81nNg3I6+KXpY6w5cP9HnX7nDSvzzWZp79kUX+S73Pt9tm
        WpZKY3GL0xIEC1zqS9NhOy4pJFyn
X-Google-Smtp-Source: APXvYqwz0gj2g1uoDWFeDz+Fcc6dQYkkBeMyevUdInJ4mvnytkpIX5RUah1RlYBuoMZk8ixu0AKvjA==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr2296649wmt.44.1552394734398;
        Tue, 12 Mar 2019 05:45:34 -0700 (PDT)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id p1sm3138013wmi.9.2019.03.12.05.45.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2019 05:45:33 -0700 (PDT)
Date:   Tue, 12 Mar 2019 13:45:32 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Message-ID: <20190312124532.GO31026@ulmo>
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vNrHrykRFvLVX6W3"
Content-Disposition: inline
In-Reply-To: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vNrHrykRFvLVX6W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>=20
> This patch fixes deadlock warning if removing PWM device
> when CONFIG_PROVE_LOCKING is enabled.
>=20
> This issue can be reproceduced by the following steps on
> the R-Car H3 Salvator-X board if the backlight is disabled:
>=20
>  # cd /sys/class/pwm/pwmchip0
>  # echo 0 > export
>  # ls
>  device  export  npwm  power  pwm0  subsystem  uevent  unexport
>  # cd device/driver
>  # ls
>  bind  e6e31000.pwm  uevent  unbind
>  # echo e6e31000.pwm > unbind
>=20
> [   87.659974] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   87.666149] WARNING: possible circular locking dependency detected
> [   87.672327] 5.0.0 #7 Not tainted
> [   87.675549] ------------------------------------------------------
> [   87.681723] bash/2986 is trying to acquire lock:
> [   87.686337] 000000005ea0e178 (kn->count#58){++++}, at: kernfs_remove_b=
y_name_ns+0x50/0xa0
> [   87.694528]
> [   87.694528] but task is already holding lock:
> [   87.700353] 000000006313b17c (pwm_lock){+.+.}, at: pwmchip_remove+0x28=
/0x13c
> [   87.707405]
> [   87.707405] which lock already depends on the new lock.
> [   87.707405]
> [   87.715574]
> [   87.715574] the existing dependency chain (in reverse order) is:
> [   87.723048]
> [   87.723048] -> #1 (pwm_lock){+.+.}:
> [   87.728017]        __mutex_lock+0x70/0x7e4
> [   87.732108]        mutex_lock_nested+0x1c/0x24
> [   87.736547]        pwm_request_from_chip.part.6+0x34/0x74
> [   87.741940]        pwm_request_from_chip+0x20/0x40
> [   87.746725]        export_store+0x6c/0x1f4
> [   87.750820]        dev_attr_store+0x18/0x28
> [   87.754998]        sysfs_kf_write+0x54/0x64
> [   87.759175]        kernfs_fop_write+0xe4/0x1e8
> [   87.763615]        __vfs_write+0x40/0x184
> [   87.767619]        vfs_write+0xa8/0x19c
> [   87.771448]        ksys_write+0x58/0xbc
> [   87.775278]        __arm64_sys_write+0x18/0x20
> [   87.779721]        el0_svc_common+0xd0/0x124
> [   87.783986]        el0_svc_compat_handler+0x1c/0x24
> [   87.788858]        el0_svc_compat+0x8/0x18
> [   87.792947]
> [   87.792947] -> #0 (kn->count#58){++++}:
> [   87.798260]        lock_acquire+0xc4/0x22c
> [   87.802353]        __kernfs_remove+0x258/0x2c4
> [   87.806790]        kernfs_remove_by_name_ns+0x50/0xa0
> [   87.811836]        remove_files.isra.1+0x38/0x78
> [   87.816447]        sysfs_remove_group+0x48/0x98
> [   87.820971]        sysfs_remove_groups+0x34/0x4c
> [   87.825583]        device_remove_attrs+0x6c/0x7c
> [   87.830197]        device_del+0x11c/0x33c
> [   87.834201]        device_unregister+0x14/0x2c
> [   87.838638]        pwmchip_sysfs_unexport+0x40/0x4c
> [   87.843509]        pwmchip_remove+0xf4/0x13c
> [   87.847773]        rcar_pwm_remove+0x28/0x34
> [   87.852039]        platform_drv_remove+0x24/0x64
> [   87.856651]        device_release_driver_internal+0x18c/0x21c
> [   87.862391]        device_release_driver+0x14/0x1c
> [   87.867175]        unbind_store+0xe0/0x124
> [   87.871265]        drv_attr_store+0x20/0x30
> [   87.875442]        sysfs_kf_write+0x54/0x64
> [   87.879618]        kernfs_fop_write+0xe4/0x1e8
> [   87.884055]        __vfs_write+0x40/0x184
> [   87.888057]        vfs_write+0xa8/0x19c
> [   87.891887]        ksys_write+0x58/0xbc
> [   87.895716]        __arm64_sys_write+0x18/0x20
> [   87.900154]        el0_svc_common+0xd0/0x124
> [   87.904417]        el0_svc_compat_handler+0x1c/0x24
> [   87.909289]        el0_svc_compat+0x8/0x18
> [   87.913378]
> [   87.913378] other info that might help us debug this:
> [   87.913378]
> [   87.921374]  Possible unsafe locking scenario:
> [   87.921374]
> [   87.927286]        CPU0                    CPU1
> [   87.931808]        ----                    ----
> [   87.936331]   lock(pwm_lock);
> [   87.939293]                                lock(kn->count#58);
> [   87.945120]                                lock(pwm_lock);
> [   87.950599]   lock(kn->count#58);
> [   87.953908]
> [   87.953908]  *** DEADLOCK ***
> [   87.953908]
> [   87.959821] 4 locks held by bash/2986:
> [   87.963563]  #0: 00000000ace7bc30 (sb_writers#6){.+.+}, at: vfs_write+=
0x188/0x19c
> [   87.971044]  #1: 00000000287991b2 (&of->mutex){+.+.}, at: kernfs_fop_w=
rite+0xb4/0x1e8
> [   87.978872]  #2: 00000000f739d016 (&dev->mutex){....}, at: device_rele=
ase_driver_internal+0x40/0x21c
> [   87.988001]  #3: 000000006313b17c (pwm_lock){+.+.}, at: pwmchip_remove=
+0x28/0x13c
> [   87.995481]
> [   87.995481] stack backtrace:
> [   87.999836] CPU: 0 PID: 2986 Comm: bash Not tainted 5.0.0 #7
> [   88.005489] Hardware name: Renesas Salvator-X board based on r8a7795 E=
S1.x (DT)
> [   88.012791] Call trace:
> [   88.015235]  dump_backtrace+0x0/0x190
> [   88.018891]  show_stack+0x14/0x1c
> [   88.022204]  dump_stack+0xb0/0xec
> [   88.025514]  print_circular_bug.isra.32+0x1d0/0x2e0
> [   88.030385]  __lock_acquire+0x1318/0x1864
> [   88.034388]  lock_acquire+0xc4/0x22c
> [   88.037958]  __kernfs_remove+0x258/0x2c4
> [   88.041874]  kernfs_remove_by_name_ns+0x50/0xa0
> [   88.046398]  remove_files.isra.1+0x38/0x78
> [   88.050487]  sysfs_remove_group+0x48/0x98
> [   88.054490]  sysfs_remove_groups+0x34/0x4c
> [   88.058580]  device_remove_attrs+0x6c/0x7c
> [   88.062671]  device_del+0x11c/0x33c
> [   88.066154]  device_unregister+0x14/0x2c
> [   88.070070]  pwmchip_sysfs_unexport+0x40/0x4c
> [   88.074421]  pwmchip_remove+0xf4/0x13c
> [   88.078163]  rcar_pwm_remove+0x28/0x34
> [   88.081906]  platform_drv_remove+0x24/0x64
> [   88.085996]  device_release_driver_internal+0x18c/0x21c
> [   88.091215]  device_release_driver+0x14/0x1c
> [   88.095478]  unbind_store+0xe0/0x124
> [   88.099048]  drv_attr_store+0x20/0x30
> [   88.102704]  sysfs_kf_write+0x54/0x64
> [   88.106359]  kernfs_fop_write+0xe4/0x1e8
> [   88.110275]  __vfs_write+0x40/0x184
> [   88.113757]  vfs_write+0xa8/0x19c
> [   88.117065]  ksys_write+0x58/0xbc
> [   88.120374]  __arm64_sys_write+0x18/0x20
> [   88.124291]  el0_svc_common+0xd0/0x124
> [   88.128034]  el0_svc_compat_handler+0x1c/0x24
> [   88.132384]  el0_svc_compat+0x8/0x18
>=20
> This warning occurs because pwmchip_remove still keeps pwm_lock
> when removing sysfs. That's why it leads to that conflict.
> Hence, this patch unlocks pwm_lock before removing sysfs.
> Also, pwmchip_sysfs_export() doesn't seem to need the pwm_lock
> held so that to achieve consistance between export and
> unexport this patch also modifies it.
>=20
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> [shimoda: revise the commit log and code]
> Fixes: 76abbdde2d95 ("pwm: Add sysfs interface")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/pwm/core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 1581f6a..2fdd6611 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -311,10 +311,12 @@ int pwmchip_add_with_polarity(struct pwm_chip *chip,
>  	if (IS_ENABLED(CONFIG_OF))
>  		of_pwmchip_add(chip);
> =20
> -	pwmchip_sysfs_export(chip);
> -
>  out:
>  	mutex_unlock(&pwm_lock);
> +
> +	if (!ret)
> +		pwmchip_sysfs_export(chip);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pwmchip_add_with_polarity);
> @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
> =20
>  	free_pwms(chip);
> =20
> -	pwmchip_sysfs_unexport(chip);
> -
>  out:
>  	mutex_unlock(&pwm_lock);
> +
> +	if (!ret)
> +		pwmchip_sysfs_unexport(chip);
> +

I don't exactly remember why he sysfs unexport happens this late. It's
completely asymmetric to what we do in pwmchip_add_with_polarity() and
commit 0733424c9ba9 ("pwm: Unexport children before chip removal") is
a strong indication that this was wrong to begin with. Maybe we should
just move pwmchip_sysfs_unexport() where it belongs, which is right
after pwmchip_sysfs_unexport_children(). In that case, we probably do
not need separate functions anymore either.

We also really want to remove sysfs irrespective of whether or not the
chip will be removed as a result of pwmchip_remove(). We can only assume
that the driver will be gone after that, so we shouldn't leave any
dangling sysfs files around.

Yoshihiro, does it work if you move pwmchip_sysfs_unexport() to the top
of pwmchip_remove(), right below pwmchip_sysfs_unexport_children(),
instead? Does that get rid of the lockdep warning as well? That way it
is also outside of the pwm_lock section, which indeed doesn't seem to be
needed.

Moving the pwmchip_sysfs_export() call outside of that section also
seems fine and it'd be perfectly symmetric with pwmchip_remove() again.

Thierry

--vNrHrykRFvLVX6W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyHqekACgkQ3SOs138+
s6HylhAAsA4jSa4vBhXJcLhnz8v3O7ZcnlcwvqGHaw8cvc2ct1MC11fm8owQCegf
1Qw9CRgIGXmurr4K8OHpp8z1FzYu6pvGsLwLrKeMR4hvtWeVh/HcDSaZD8DZ1gdK
8cApNbuoG5F6HDzZDjg2HRh07qhi3DLifAkmM13XfOFXeaXzqR93rMSOyVUMAx37
ZIq14P3VMXJ+sUpYE/QbuBTQ60flfHWqzHK8y7ZaszZZVtYjWZEFHVD+/rGwxI0z
lJAVzuCDz/TPlG+AzZ2Uvu8bgcFANi8KOvktP8aMiGQ2tRYBDy20O/vOsqz3Ne2T
jvSmTQLkdHG+icHCQAF+A+o1nnIb3oTfxq9+0mqzOSuohVW487dJUvE/CaNDW2s3
qiPM6sEajnYglsYXUgAul6d6GL+AXM29Oe7GZQsnvEFxCBJcAq8DAkv7WpX2IQt3
geD+ccRo0Hz/BcR7mSd4ZnPs77UzhDWaZqilEOJ/Cocphf4CoCBE3XR3S5600h4X
1h+d7RNVuQcuXcwip4PVdHJG/e8dHDNHi6FdXVXmiPzl67amd9TDovgfITvvNDLo
23HTYMxis47glNheI6fnnsZtLL4FGce9lfaIgvtS3GmQTrhY01Wx5B9O1gXHsmB+
dg5j8/9UoONY0Iq4Z71Ih/bffbdmXs2XQ9bp10Jo/iIOWwqDccg=
=o0Yw
-----END PGP SIGNATURE-----

--vNrHrykRFvLVX6W3--
