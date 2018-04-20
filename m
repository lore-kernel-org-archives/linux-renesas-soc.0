Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-bl2nam02on0047.outbound.protection.outlook.com ([104.47.38.47]:60854
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753539AbeDTHYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 03:24:01 -0400
Subject: Re: [PATCH 53/61] tty: serial: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-serial@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-54-wsa+renesas@sang-engineering.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <ce3c4fa9-c6bc-a529-3c91-9f353d017720@xilinx.com>
Date: Fri, 20 Apr 2018 09:23:41 +0200
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-54-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19.4.2018 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/tty/serial/imx.c              | 18 ++++++------------
>  drivers/tty/serial/qcom_geni_serial.c |  6 ++----
>  drivers/tty/serial/st-asc.c           |  6 ++----
>  drivers/tty/serial/xilinx_uartps.c    |  6 ++----

Acked-by: Michal Simek <michal.simek@xilinx.com> (for xilinx)

Thanks,
Michal
