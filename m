Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34945 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387900AbeGTRI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 13:08:57 -0400
Date: Fri, 20 Jul 2018 10:19:57 -0600
From: Rob Herring <robh@kernel.org>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20180720161957.GA3486@rob-hp-laptop>
References: <1531731553-22979-1-git-send-email-phil.edworthy@renesas.com>
 <1531731553-22979-2-git-send-email-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531731553-22979-2-git-send-email-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 09:59:12AM +0100, Phil Edworthy wrote:
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate bus clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
