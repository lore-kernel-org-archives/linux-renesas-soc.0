Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:34294 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751929AbcEaMjv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 08:39:51 -0400
Received: by mail-pf0-f177.google.com with SMTP id 62so29907720pfd.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 05:39:50 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 May 2016 14:39:50 +0200
Message-ID: <CAO3366zQRg--imvRLUTtdUa-0O3n_fZCq=gmgELpO9aNcttWUA@mail.gmail.com>
Subject: DRM/KMS automated tests
From: Ulrich Hecht <ulrich.hecht@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

I have cobbled together a bunch of scripts to test the atomic updates
API, based around kms++; see here:

https://github.com/uli/kmsxx/tree/autotest

Instructions on how to set up the environment can be found here:

http://elinux.org/User:Uli/Tests:KMS

Currently, tests try various sensible and nonsensical combinations of
source and destination properties and check if the driver behaves
reasonably.

Test results look like this:

1. Lager:
# bash run_tests.sh
aaa_sanity.py
Testing connector VGA-1
PASS
atomic_flip.py  PASS
atomic_set_plane.py  PASS
atomic_small_dest.py  PASS
atomic_small_fb.py  PASS
fb_large.py  PASS
fb_small.py  PASS
mode_invalid.py  PASS
mode_reset.py  PASS
mode_set_all.py  PASS

10 passed, 0 failed, 0 skipped

2. Salvator-X:
# bash run_tests.sh
aaa_sanity.py
Testing connector VGA-1
PASS
atomic_flip.py  PASS
atomic_set_plane.py  FAIL
atomic_small_dest.py  PASS
atomic_small_fb.py  PASS
fb_large.py  PASS
fb_small.py  PASS
mode_invalid.py  PASS
mode_reset.py  PASS
mode_set_all.py  PASS

9 passed, 1 failed, 0 skipped

I have not yet looked at the FAIL on Salvator-X (might well be that
the test is bogus) because there is a bigger issue there. After
running the tests a couple of times, framebuffer allocation starts to
fail:

[  956.562285] rcar-du feb00000.display: failed to allocate buffer
with size 3145728
[  957.130012] rcar-du feb00000.display: failed to allocate buffer
with size 3145728
[  957.689012] rcar-du feb00000.display: failed to allocate buffer
with size 3194880
[  959.926459] rcar-du feb00000.display: failed to allocate buffer
with size 1921024
[...]

This does not happen on Lager, and I use the same 32-bit userspace for
both platforms. I guess there must be a memory leak in the driver
somewhere. Is this a known issue?

CU
Uli
