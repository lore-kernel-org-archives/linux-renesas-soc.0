Return-Path: <devicetree-owner@vger.kernel.org>
Date: Sun, 22 Oct 2017 03:21:06 +0100 (WEST)
Message-Id: <20171022.032106.409254810221513438.davem@davemloft.net>
To: f.fainelli@gmail.com
Cc: geert+renesas@glider.be, andrew@lunn.ch, robh+dt@kernel.org,
        frowand.list@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of_mdio: Fix broken PHY IRQ in case of probe
 deferral
From: David Miller <davem@davemloft.net>
In-Reply-To: <FD695891-F3B8-4388-8887-A9DC997828B4@gmail.com>
References: <1508327643-3579-1-git-send-email-geert+renesas@glider.be>
        <FD695891-F3B8-4388-8887-A9DC997828B4@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat, 21 Oct 2017 19:01:45 -0700

> Reviewed-by : Florian Fainelli <f.fainelli@gmail.com>
> 
> I still can't make sure this is not a problem for multiple PHYs
> hanging off the same bus, but like anything else, we'll deal with
> problems later if they arise.

Thanks Florian.

Applied, thanks everyone.
