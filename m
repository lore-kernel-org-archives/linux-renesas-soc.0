Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33640 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbdJEJMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 05:12:51 -0400
Date: Thu, 5 Oct 2017 11:12:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: adc: rcar-gyroadc: Enable compile-testing on
 non-ARM
Message-ID: <20171005091219.GJ26369@verge.net.au>
References: <1507118906-8946-1-git-send-email-geert+renesas@glider.be>
 <1507118906-8946-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507118906-8946-3-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 02:08:25PM +0200, Geert Uytterhoeven wrote:
> The rcar-gyroadc driver compiles fine on other platforms, hence increase
> compile coverage.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
