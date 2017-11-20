Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54435 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdKTJyM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 04:54:12 -0500
Date: Mon, 20 Nov 2017 10:54:02 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: renesas: Correct primary compatible value
 for eeprom
Message-ID: <20171120095401.nf6evazijmainarm@verge.net.au>
References: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 16, 2017 at 02:51:34PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The Renesas part numbers of the two-wire serial interface EEPROMs do not
> follow the 24Cxx pattern, but the R1EX24xxx pattern.
> 
> Hence change the primary compatible values to the appropriate variant of
> "renesas,r1ex24xxx", like is already done on Gose.
> 
> Note that the second patch depends on (trivial) "[PATCH] dt-bindings:
> i2c: eeprom: Add Renesas R1EX24128" to please checkpatch.

Noted.

I have applied these patches for v4.16.
