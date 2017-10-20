Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 20 Oct 2017 08:41:08 +0100 (WEST)
Message-Id: <20171020.084108.365516696070119583.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org,
        frowand.list@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of_mdio: Fix broken PHY IRQ in case of probe
 deferral
From: David Miller <davem@davemloft.net>
In-Reply-To: <1508327643-3579-1-git-send-email-geert+renesas@glider.be>
References: <1508327643-3579-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 18 Oct 2017 13:54:03 +0200

> The actual patch is unchanged since v1, sent on May 18.  Obviously I
> still cannot test it on a system with multiple PHYs, just like v1.
> 
> How can we proceed?

Andrew and Florian, please review this.
