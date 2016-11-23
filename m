Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:51579 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935913AbcKWLoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 06:44:04 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Drivers Updates for v4.10
Date: Wed, 23 Nov 2016 12:43:17 +0100
Message-ID: <4069888.eCuRFVJTuP@wuerfel>
In-Reply-To: <20161119013551.GB2543@localhost>
References: <cover.1479389981.git.horms+renesas@verge.net.au> <20161119013551.GB2543@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, November 18, 2016 5:35:51 PM CET Olof Johansson wrote:
> 
> So, this pull request contains 8 patches, not 4. Seems like your pull
> request doesn't show any of the code from Geert's branch, didn't mention
> it in the tag and only in the email text above. Furthermore, Geert's
> branch modifies driver core code, so it's extra important to make sure
> it's clear that it's an unusual pull request.
> 
> Given that this modifies driver core, please either merge that code
> through Greg first, or get an ack from him. If you merge through him,
> make sure it's on a standalone topic branch that we can share.

As discussed on IRC, I think it makes sense to track that branch
separately in arm-soc, as its own top-level next/* branch.

The branch was first merged into the mmc tree after we got consensus
on the approach.

	Arnd
