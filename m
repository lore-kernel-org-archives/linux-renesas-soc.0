Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45721 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753122AbdLDQ4j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 11:56:39 -0500
Received: by mail-lf0-f65.google.com with SMTP id f13so19899064lff.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 08:56:38 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4c0c70ac-6db2-7c8a-4e5e-9364919e5012@cogentembedded.com>
Date: Mon, 4 Dec 2017 19:56:35 +0300
MIME-Version: 1.0
In-Reply-To: <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 05:17 PM, Thomas Petazzoni wrote:

> This commit adds the sh_eth_cpu_data structure that describes the
> SH7786 variant of the IP.

    The manual seems to be unavailable, so I have to trust you. :-)

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
