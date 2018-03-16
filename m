Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34194 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbeCPIzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:55:55 -0400
Received: by mail-wm0-f52.google.com with SMTP id a20so1771205wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:55:55 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:55:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 0/8] Non-Intel test suite fixes
Message-ID: <20180316085551.GG14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:36PM +0100, Ulrich Hecht wrote:
> Hi!
> 
> I have run the tests on a Renesas R-Car M3-W's DU device, and have found a
> number of false negatives that mostly stem from use of Intel-specifics
> without checking if that makes sense first. So here's a bunch of fixes for
> those, hope they are generic enough for upstreaming.

Nice, other people using this! Do you plan to maintain this actively going
forward, or is this more a one-off effort? If you're planning to stick
around we'd be happy to fix you up with commit rights to make this all a
bit smoother (after a few of your patches have been merged ofc).

Cheers, Daniel
> 
> CU
> Uli
> 
> 
> Ulrich Hecht (8):
>   tests/kms_addfb_basic: skip i915-specific tests on other platforms
>   tests/kms_panel_fitting: check for i915 before checking version
>   lib/igt_gt: has_gpu_reset(): fix failed assertion on non-i915
>     platforms
>   lib/igt_gt: check for presence of GPU reset before using it
>   tests/kms_plane_lowres: skip i915-specific tests on other platforms
>   lib/igt_pm: turn absence of autosuspend_delay_ms from fail to skip
>   tests/kms_addfb_basic: size_tests(): reduce test buffer size
>   test/kms_addfb_basic: tolerate absence of 8-bit format
> 
>  lib/igt_gt.c              | 24 ++++++++++++++----------
>  lib/igt_pm.c              |  2 +-
>  tests/kms_addfb_basic.c   | 33 ++++++++++++++++++---------------
>  tests/kms_panel_fitting.c |  1 +
>  tests/kms_plane_lowres.c  |  1 +
>  5 files changed, 35 insertions(+), 26 deletions(-)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
