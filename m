Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52760 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752742AbcKORxo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 12:53:44 -0500
Date: Tue, 15 Nov 2016 18:53:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/11] soc: renesas: Identify SoC and register with
 the SoC bus
Message-ID: <20161115175336.GA4065@verge.net.au>
References: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 14, 2016 at 07:37:06PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> Some Renesas SoCs may exist in different revisions, providing slightly
> different functionalities (e.g. R-Car H3 ES1.x and ES2.0), and behavior
> (errate and quirks).  This needs to be catered for by drivers and/or
> platform code.  The recently proposed soc_device_match() API is a good
> fit to handle this.
> 
> This patch series implements the core infrastructure to provide SoC and
> revision information through the SoC bus for Renesas ARM SoCs.

For the record I have queued this up.
