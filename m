Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2] irqchip/renesas-irqc: Postpone driver initialization
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
References: <1478633747-26878-1-git-send-email-geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <216fe100-556b-7f83-39b0-4cf54c1fa35c@gmail.com>
Date: Tue, 8 Nov 2016 11:42:21 -0800
MIME-Version: 1.0
In-Reply-To: <1478633747-26878-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/08/2016 11:35 AM, Geert Uytterhoeven wrote:
> Currently the renesas-irqc driver uses postcore_initcall().
> 
> However, the new CPG/MSSR driver uses subsys_initcall(). Hence the
> IRQC's probe will be deferred, which causes the Micrel Ethernet PHY to
> not find its interrupt on R-Car Gen2 and RZ/G, as the of_mdio subsystem
> does not support deferred probe yet.

Is not that the more correct fix to implement though?
-- 
Florian
