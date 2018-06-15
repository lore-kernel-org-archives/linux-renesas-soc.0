Return-Path: <linux-i2c-owner@vger.kernel.org>
Subject: Re: [RFT] i2c: algos: bit: prepare/unprepare before sending initial
 STOP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, cerg2010cerg2010@mail.ru
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20180615051723.7193-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ca996c6d-4a95-12ae-7200-b49a31c93c31@cogentembedded.com>
Date: Fri, 15 Jun 2018 11:25:27 +0300
MIME-Version: 1.0
In-Reply-To: <20180615051723.7193-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/15/2018 8:17 AM, Wolfram Sang wrote:

> Some adapters need to be prepared/unprepared before bitbanging the bus.

    Before/after?

> Do this for the initial STOP, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

MBR, Sergei
