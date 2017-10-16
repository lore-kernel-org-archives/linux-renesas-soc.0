Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751438AbdJPJmo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 05:42:44 -0400
Date: Mon, 16 Oct 2017 11:42:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/13] ARM: dts: r8a7790: Add clocks for CA7 CPU cores
Message-ID: <20171016094234.i3jzpo6nern3h6nr@verge.net.au>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
 <1507800916-11509-9-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507800916-11509-9-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 12, 2017 at 11:35:11AM +0200, Geert Uytterhoeven wrote:
> Currently only the CPU cores in the CA15 cluster have clocks properties.
> Add the missing clocks properties for the CPU cores in the CA7 cluster
> to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Simon Horman <horms+renesas@verge.net.au>
