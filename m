Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 3/4] net: sh_eth: constify platform_device_id
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, wg@grandegger.com,
        mkl@pengutronix.de, madalin.bucur@nxp.com, davem@davemloft.net,
        grygorii.strashko@ti.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1502622762-11275-1-git-send-email-arvind.yadav.cs@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <eab06299-518f-257a-7b73-589ff5210e01@cogentembedded.com>
Date: Mon, 14 Aug 2017 14:41:57 +0300
MIME-Version: 1.0
In-Reply-To: <1502622762-11275-1-git-send-email-arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 08/13/2017 02:12 PM, Arvind Yadav wrote:

> platform_device_id are not supposed to change at runtime. All functions
> working with platform_device_id provided by <linux/platform_device.h>
> work with const platform_device_id. So mark the non-const structs as
> const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

though it seems too late as DaveM has taken the series...

[...]

MBR, Sergei
