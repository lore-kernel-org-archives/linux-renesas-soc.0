Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35151 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbcF3NQ0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 09:16:26 -0400
Received: by mail-oi0-f44.google.com with SMTP id r2so64020900oih.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2016 06:16:26 -0700 (PDT)
MIME-Version: 1.0
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Thu, 30 Jun 2016 15:16:24 +0200
Message-ID: <CAO3366w+UpbOEijqjnggL2hzZjEnMXYfneSbCf9Ca_JGe_OwKQ@mail.gmail.com>
Subject: Loopback video test
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

At https://github.com/uli/looptest you can find a script to verify
video output using a V4L input device. It creates a test pattern in
various resolutions using modetest, captures it on a given video input
device, and then does a fuzzy compare to verify that the captured
frame sorta kinda looks the way it should. The README file explains
how to use it and what external tools it relies on.

I have run these tests on a Lager board with an HDMI cable connecting
HDMI OUT and HDMI IN; I have found these issues with the output
signal:

- Mode 640x480-60, of all things, does not work.
- After switching a couple of times between resolutions that otherwise
work, sometimes no valid output is produced anymore.
- Two more exotic modes that are in the default mode list (that is
used when the input device does not send a valid EDID blob), namely
848x480-60 and 800x600-56, do not produce valid output.

When any of these things happen, the output remains invalid until the
next reboot, i.e. switching back to a working mode does not help.

(There is also an issue with the VIN input, which sometimes fails to
use up-to-date DV timings when capturing the first frame after
switching modes. This is worked around by capturing the frame twice.)

CU
Uli
