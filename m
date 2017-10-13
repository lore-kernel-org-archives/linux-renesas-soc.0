Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 13 Oct 2017 09:58:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 3/5] mfd: bd9571mwv: Allow DDR Backup Power register
 access
Message-ID: <20171013085851.ljvgmyd6ei2tv5fw@dell>
References: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
 <1507649178-31473-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1507649178-31473-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 10 Oct 2017, Geert Uytterhoeven wrote:

> Enable read/write access to the BD9571MWV_BKUP_MODE_CNT register, which
> is a.o. used to configure DDR Backup Power.

a.o.?  That's a new one on me.

Please ensure commit logs are clear for *everyone* to read/understand
by using descriptive and expanded (rather than shorten) terms.

Code looks fine though, so once fixed:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
