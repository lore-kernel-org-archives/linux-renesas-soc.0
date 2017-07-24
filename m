Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:38760 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbdGXT7H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 15:59:07 -0400
Date: Mon, 24 Jul 2017 14:59:05 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car D3
 power areas
Message-ID: <20170724195905.3wsf6kuxfgygbsuw@rob-hp-laptop>
References: <1500554094-22198-1-git-send-email-geert+renesas@glider.be>
 <1500554094-22198-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554094-22198-4-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 20, 2017 at 02:34:53PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/power/renesas,rcar-sysc.txt           |  1 +
>  drivers/soc/renesas/Kconfig                        |  5 ++++
>  drivers/soc/renesas/Makefile                       |  1 +
>  drivers/soc/renesas/r8a77995-sysc.c                | 31 ++++++++++++++++++++++
>  drivers/soc/renesas/rcar-sysc.c                    |  3 +++
>  drivers/soc/renesas/rcar-sysc.h                    |  1 +
>  6 files changed, 42 insertions(+)
>  create mode 100644 drivers/soc/renesas/r8a77995-sysc.c

Acked-by: Rob Herring <robh@kernel.org>
