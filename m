Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 20 Apr 2018 08:49:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] regulator: bd9571mwv: Add support for DDR backup
 mode
Message-ID: <20180420074914.vl4rer5zdeldfzb3@dell>
References: <1524057484-25350-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1524057484-25350-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 18 Apr 2018, Geert Uytterhoeven wrote:

> 	Hi all,
> 
> The ROHM BD9571MWV PMIC on the Renesas Salvator-X(S) and ULCB
> development boards supports DDR Backup Power, which means that the DDR
> power rails can be kept powered while the main SoC is powered down.

Should this set be applied together, or can the MFD patches be applied
on their own, without the Regulator patch?

If the former, then we're going to need an Ack from Mark.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
