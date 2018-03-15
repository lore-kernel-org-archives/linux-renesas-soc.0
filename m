Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:39736 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752271AbeCOOp5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:45:57 -0400
Received: by mail-wm0-f66.google.com with SMTP id u10so10832395wmu.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Mar 2018 07:45:57 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH igt 0/8] Non-Intel test suite fixes
Date: Thu, 15 Mar 2018 15:45:36 +0100
Message-Id: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

I have run the tests on a Renesas R-Car M3-W's DU device, and have found a
number of false negatives that mostly stem from use of Intel-specifics
without checking if that makes sense first. So here's a bunch of fixes for
those, hope they are generic enough for upstreaming.

CU
Uli


Ulrich Hecht (8):
  tests/kms_addfb_basic: skip i915-specific tests on other platforms
  tests/kms_panel_fitting: check for i915 before checking version
  lib/igt_gt: has_gpu_reset(): fix failed assertion on non-i915
    platforms
  lib/igt_gt: check for presence of GPU reset before using it
  tests/kms_plane_lowres: skip i915-specific tests on other platforms
  lib/igt_pm: turn absence of autosuspend_delay_ms from fail to skip
  tests/kms_addfb_basic: size_tests(): reduce test buffer size
  test/kms_addfb_basic: tolerate absence of 8-bit format

 lib/igt_gt.c              | 24 ++++++++++++++----------
 lib/igt_pm.c              |  2 +-
 tests/kms_addfb_basic.c   | 33 ++++++++++++++++++---------------
 tests/kms_panel_fitting.c |  1 +
 tests/kms_plane_lowres.c  |  1 +
 5 files changed, 35 insertions(+), 26 deletions(-)

-- 
2.7.4
