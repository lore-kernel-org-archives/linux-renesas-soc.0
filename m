Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37888 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbdGXT5k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 15:57:40 -0400
Date: Mon, 24 Jul 2017 14:57:38 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: shmobile: Document R-Car D3 SoC DT bindings
Message-ID: <20170724195738.tjxzivlwt7jsndvs@rob-hp-laptop>
References: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
 <1500553741-21890-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500553741-21890-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 20, 2017 at 02:28:59PM +0200, Geert Uytterhoeven wrote:
> Note that r8a77995 is the first Renesas "r8a<n>" SoC matching against a 5
> digit number, as r8a77990 will be a different SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
