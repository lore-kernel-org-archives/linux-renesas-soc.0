Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36962 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752559AbcIBI0L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:26:11 -0400
Date: Fri, 2 Sep 2016 10:26:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: dts: r7s72100: add ethernet clock to device
 tree
Message-ID: <20160902082604.GD16669@verge.net.au>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
 <20160902014012.9383-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160902014012.9383-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks Chris,

I have queued up this and the following 2 patches for v4.9 (nothing more
for you to do unless something goes wrong in which case I'll let you know).

For future submissions please consider:
1. Supplying a cover letter (git format-patch has a --cover-letter option)
   for patch-sets comprising more than one patch. This allows you to describe
   an overview of what the series as a whole achieves. And is also
   convenient for maintainers to reply to when accepting your patches.
2. Starting a new thread for each new version of a patch/patch-set.

Different maintainers have different preferences. The above are mine.
