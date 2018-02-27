Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54420 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751952AbeB0IRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:17:40 -0500
Date: Tue, 27 Feb 2018 09:17:21 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: Document SoC compatible value for
 Armadillo-800 EVA
Message-ID: <20180227081720.ejxqgr5zbufxkfmi@verge.net.au>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
 <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 26, 2018 at 07:03:42PM +0100, Geert Uytterhoeven wrote:
> The compatible property of the root node in a DTS for Atmark Techno
> Armadillo-800 EVA should include the compatible value for the R-Mobile
> A1 SoC, too.
> 
> Fixes: d2c2a0776899ba2d ("ARM: shmobile: Add platform device tree bindings documentation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
