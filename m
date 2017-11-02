Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43806 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752759AbdKBIS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 04:18:59 -0400
Date: Thu, 2 Nov 2017 09:18:39 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] [RFC] ARM: shmobile: pm-rmobile: Use
 GENPD_FLAG_ACTIVE_WAKEUP
Message-ID: <20171102081838.qfojh7wzmau4x63c@verge.net.au>
References: <1509473494-19740-1-git-send-email-geert+renesas@glider.be>
 <1509473494-19740-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509473494-19740-3-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 31, 2017 at 07:11:31PM +0100, Geert Uytterhoeven wrote:
> Set the newly introduced GENPD_FLAG_ACTIVE_WAKEUP, which allows to
> remove the driver's own "always true" callback.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This must not be applied before "PM / Domain: Enable genpd users to
> specify default active wakeup behavior" has landed upstream, hence the
> "RFC".

Assuming you would like this to go through Rafael's tree rather than mine:

Acked-by: Simon Horman <horms+renesas@verge.net.au>
