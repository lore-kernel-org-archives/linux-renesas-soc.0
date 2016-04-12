Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1459935952-4639-1-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1459935952-4639-1-git-send-email-sjoerd.simons@collabora.co.uk>
Date: Tue, 12 Apr 2016 09:40:30 +0200
Message-ID: <CAMuHMdW7anK4LqraZmJqJwrB7AuqWmLLDUenEUazHCScu022dw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Only unwindow as necessary on probe failure
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sjoerd,

On Wed, Apr 6, 2016 at 11:45 AM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> Simply calling rcar_du_remove on any error can cause unbalanced calls to
> various functions (e.g. drm_connector_register/unregister,
> drm_dev_register/drm_dev_unref).
>
> This can be seen at bootup of my Porter boards with current next:
>
> [    2.789322] rcar-du feb00000.display: failed to initialize DRM/KMS (-517)
> [    2.796267] ------------[ cut here ]------------
> [    2.800996] WARNING: CPU: 1 PID: 1 at include/drm/drm_crtc.h:2623 drm_connector_unregister_all+0x60/0x68
> [    2.810689] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc2-next-20160405-dirty #11
> [    2.818864] Hardware name: Generic R8A7791 (Flattened Device Tree)
> [    2.825174] Backtrace:
> [    2.827699] [<c010aa2c>] (dump_backtrace) from [<c010abd8>] (show_stack+0x18/0x1c)
> [    2.835430]  r7:c042da78 r6:00000009 r5:60000013 r4:00000000
> [    2.841251] [<c010abc0>] (show_stack) from [<c0379244>] (dump_stack+0x84/0xa4)
> [    2.848632] [<c03791c0>] (dump_stack) from [<c011c3b0>] (__warn+0xd0/0x100)
> [    2.855739]  r5:00000000 r4:00000000
> [    2.859409] [<c011c2e0>] (__warn) from [<c011c498>] (warn_slowpath_null+0x28/0x30)
> [    2.867139]  r9:00000001 r8:ef1dc610 r7:ef114010 r6:ef1dc600 r5:ef114010 r4:ef2f2400
> [    2.875096] [<c011c470>] (warn_slowpath_null) from [<c042da78>] (drm_connector_unregister_all+0x60/0x68)
> [    2.884785] [<c042da18>] (drm_connector_unregister_all) from [<c0440ac8>] (rcar_du_remove+0x1c/0x5c)
> [    2.894111]  r5:ef114010 r4:ef2f2400
> [    2.897780] [<c0440aac>] (rcar_du_remove) from [<c0440d50>] (rcar_du_probe+0x1d0/0x210)
> [    2.905953]  r5:ef2f2400 r4:fffffdfb
> [    2.909625] [<c0440b80>] (rcar_du_probe) from [<c044c1d4>] (platform_drv_probe+0x58/0xa8)
> [    2.917976]  r9:00000000 r8:c0a1cca4 r7:c0a71a48 r6:c0a1cca4 r5:ef1dc610 r4:c0440b80
>
> Adjust the code to only unwind as necessary on probe failures
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Thanks!

I can confirm your patch fixes the same warning on r8a7791/koelsch, so
I'll include it in today's renesas-drivers release.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
