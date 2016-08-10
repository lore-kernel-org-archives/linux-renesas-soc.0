Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36036 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S938577AbcHJSps (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 10 Aug 2016 14:45:48 -0400
Received: by mail-wm0-f45.google.com with SMTP id q128so110828884wma.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Aug 2016 11:45:47 -0700 (PDT)
Subject: Re: [PATCH] ravb: use proper names for suspend/resume functions
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <20160810110949.16608-1-niklas.soderlund+renesas@ragnatech.se>
Cc: davem@davemloft.net, wsa@the-dreams.de
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <44ec3396-bd72-9f95-8c15-ae030efa4b64@cogentembedded.com>
Date: Wed, 10 Aug 2016 14:16:58 +0300
MIME-Version: 1.0
In-Reply-To: <20160810110949.16608-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8/10/2016 2:09 PM, Niklas Söderlund wrote:

> The patch 'ravb: add sleep PM suspend/resume support' used incorrect

    Actually, that patch should now have immutable SHA1 ID.

> function names containing 'runtime' for the suspend and resume
> functions.
>
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
