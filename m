Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33143 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751538AbdFIUoL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 16:44:11 -0400
Received: by mail-lf0-f43.google.com with SMTP id m77so9259450lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jun 2017 13:44:10 -0700 (PDT)
Subject: Re: [PATCH v2] sh_eth: add support to change MTU
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
References: <20170609203215.1206-1-niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1ec5a4ad-cc56-fc76-257e-cfa7a775575c@cogentembedded.com>
Date: Fri, 9 Jun 2017 23:44:07 +0300
MIME-Version: 1.0
In-Reply-To: <20170609203215.1206-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/09/2017 11:32 PM, Niklas Söderlund wrote:

> The hardware supports the MTU to be changed and the driver it self is
> somewhat prepared to support this. This patch hooks up the callbacks to
> be able to change the MTU from user-space.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> ---
>
> Based on v4.12-rc1 and tested on Renesas R-Car Koelsch M2.
>
> Test procedure:
>
> 1. On host set MTU to something large (9000) was used for this test.
>
> 2. On target set MTU to something other then 1500, in this test the max
>    MTU of 1978 is used.
>
> 3. Send ping with large payload and observe that it works.
>
>    ping -M do -s 1954 <target>
>
>    The reason for 1954 instead of 1982 is two fold:
>
>    1. On Linux (different on Mac IIRC) the ICMP/ping implementation
>       doesn’t encapsulate the 28 byte ICMP (8) + IP (20).
>    2. The driver internally reserve 4 bytes of transmission buffer for
>       an optional VLAN header (4). And since no VLAN is used in this
>       setup the additional 4 bytes can carry data.
>
> 4. For extra verification the packet flow is inspected using tcpdump to
>    verify that there is no packet fragmentation.
>
> * Changes since v1
> - Fix spelling mistake in comment, thanks Sergei!
> - Add Acked-by from Sergei.
>
>  drivers/net/ethernet/renesas/sh_eth.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index f68c4db656eda846..9c6e4025bfc9f5c5 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -2558,6 +2558,17 @@ static int sh_eth_do_ioctl(struct net_device *ndev, struct ifreq *rq, int cmd)
>  	return phy_mii_ioctl(phydev, rq, cmd);
>  }
>
> +static int sh_eth_change_mtu(struct net_device *dev, int new_mtu)

    Hmm, wait... The 'struct net_device *' typed variables are consistently 
called 'ndev' throughout the driver. Please rename, sorry for not noticing the 
1st time... :-<

[...]

MBR, Sergei
