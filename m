Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 3/4] phy: rcar-gen3-usb2: add SoC-specific parameter for
 dedicated pins
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504164672-20677-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4feced7a-6fcc-096e-d056-af87be4d4686@cogentembedded.com>
Date: Thu, 31 Aug 2017 12:43:07 +0300
MIME-Version: 1.0
In-Reply-To: <1504164672-20677-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8/31/2017 10:31 AM, Yoshihiro Shimoda wrote:

> This patch adds SoC-specific parameter to avoid reading/writing
> specific registers wronly if this driver runs on a SoC which doesn't

    Wrongly? Perhaps "incorrectly"?

> have dedicated pins (e.g. R-Car D3).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
