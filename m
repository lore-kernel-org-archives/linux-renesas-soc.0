Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 28 Sep 2016 05:02:11 -0400 (EDT)
Message-Id: <20160928.050211.83034155475168918.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH resend] sh_eth: add R8A7743/5 support
From: David Miller <davem@davemloft.net>
In-Reply-To: <1654835.SEcvPVx4OQ@wasted.cogentembedded.com>
References: <1654835.SEcvPVx4OQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 27 Sep 2016 01:23:26 +0300

> Add support for the first two members of the Renesas RZ/G family, RZ/G1M/E
> (also known as  R8A7743/5). The Ether core is the same as in the R-Car gen2
> SoCs, so will share the code/data with them...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the DaveM's 'net-next.git' repo.
> 
> Re-sending with the DT maintainers/list included this time...

Applied, thanks Sergei.
