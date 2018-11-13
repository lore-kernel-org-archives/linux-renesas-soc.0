Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58333 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbeKNA1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:27:32 -0500
Message-ID: <1542119343.4774.17.camel@pengutronix.de>
Subject: Re: [PATCH] reset: Add reset_control_get_count()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        kvm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Tue, 13 Nov 2018 15:29:03 +0100
In-Reply-To: <20181113124744.7769-1-geert+renesas@glider.be>
References: <20181113124744.7769-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tue, 2018-11-13 at 13:47 +0100, Geert Uytterhoeven wrote:
> Currently the reset core has internal support for counting the number of
> resets for a device described in DT.  Generalize this to devices using
> lookup resets, and export it for public use.
> 
> This will be used by generic drivers that need to be sure a device is
> controlled by a single, dedicated reset line (e.g. vfio-platform).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you, I have applied this patch to reset/next.

regards
Philipp
