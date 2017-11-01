Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:51541 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933654AbdKAVtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 17:49:05 -0400
Date: Wed, 1 Nov 2017 16:49:04 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: shmobile: Document Renesas M3-W-based
 Salvator-XS board DT bindings
Message-ID: <20171101214904.b5adavvirlmphnqn@rob-hp-laptop>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
 <1509384599-28953-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509384599-28953-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 30, 2017 at 06:29:57PM +0100, Geert Uytterhoeven wrote:
> The Renesas Salvator-XS (Salvator-X 2nd version) development board can
> be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
> pin-compatible.
> 
> Document board part number and compatible values for the version with
> R-Car M3-W.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
