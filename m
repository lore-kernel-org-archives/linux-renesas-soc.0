Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:52928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757562AbeD0QDP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 12:03:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH igt 0/8] Non-Intel test suite fixes
Date: Fri, 27 Apr 2018 19:03:28 +0300
Message-ID: <14824305.yKoR7O8rpT@avalon>
In-Reply-To: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Thursday, 15 March 2018 16:45:36 EEST Ulrich Hecht wrote:
> Hi!
> 
> I have run the tests on a Renesas R-Car M3-W's DU device, and have found a
> number of false negatives that mostly stem from use of Intel-specifics
> without checking if that makes sense first. So here's a bunch of fixes for
> those, hope they are generic enough for upstreaming.

I'm looking for instructions on how to compile and use igt on elinux.org but 
can't find them. Could you please point me to the relevant page ?

Also, what are your plans to get those patches merged upstream ?

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

-- 
Regards,

Laurent Pinchart
