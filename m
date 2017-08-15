Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38609 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdHOXuP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 19:50:15 -0400
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 95ED82017E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 01:48:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [ANN] R-Car DU Test Suite
Date: Wed, 16 Aug 2017 02:50:39 +0300
Message-ID: <15495932.QGdd9KR0ZS@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

In the spirit of the VSP unit test suite, new Python-based unit tests for the 
R-Car DU are now available at

	git://git.ideasonboard.com/renesas/kms-tests.git

The http://elinux.org/R-Car/Devices wiki page has been updated to reference 
the unit test suite.

The tests were written to use a modular class-based approach in order to 
facilitate development of new tests and maintenance of existing tests. They 
are located in the tests directory of the source tree.

All tests are scripts and don't need to be built. They require Python3 and the 
kmsxx Python bindings to be installed on the target. More information can be 
found in the README file at the root of the source tree.

The DU test suite currently contains the following tests.

- kms-test-allplanes.py: Test composition with all planes enabled on all CRTCs
- kms-test-connectors.py: Perform sanity checks on all connectors.
- kms-test-modeset.py: Test mode setting on all connectors in sequence with 
the default mode.
- kms-test-modes.py: Test all available modes on all available connectors.
- kms-test-pageflip.py: Test page flipping on all connectors in sequence with 
the default mode.
- kms-test-planeposition.py: Test boundaries of plane positioning.

More tests will be added in the future.

Execution of the tests is automated, but manual verification is still required 
as the test suite currently has no mean to capture the output of the VGA, HDMI 
and LVDS connectors. This area will be improved by using HDMI loopback from DU 
to VIN and hardware CRC calculation on output frames.

-- 
Regards,

Laurent Pinchart
