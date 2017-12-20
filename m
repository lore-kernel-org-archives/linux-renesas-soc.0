Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52283 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932106AbdLTIqq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 03:46:46 -0500
Date: Wed, 20 Dec 2017 09:46:41 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: pwm: renesas-tpu: Document
 r8a774[35] support
Message-ID: <20171220084641.xhlsmov47okde5wo@verge.net.au>
References: <1513690500-12165-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513690500-12165-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513690500-12165-5-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 19, 2017 at 01:34:59PM +0000, Fabrizio Castro wrote:
> Document r8a774[35] specific compatible strings. No driver change is
> needed as the fallback compatible string "renesas,tpu" activates the
> right code in the driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> * No change

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
