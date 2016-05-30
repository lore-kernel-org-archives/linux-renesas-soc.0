Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34456 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755074AbcE3OVd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 10:21:33 -0400
Received: by mail-lf0-f41.google.com with SMTP id k98so73208993lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 07:21:32 -0700 (PDT)
Subject: Re: [PATCH net-next] ravb: Add SET_RUNTIME_PM_OPS macro
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, netdev@vger.kernel.org
References: <1464553543-19091-1-git-send-email-ykaneko0929@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <10f5bdf9-de75-5321-cd52-6b154fcbd05e@cogentembedded.com>
Date: Mon, 30 May 2016 17:21:24 +0300
MIME-Version: 1.0
In-Reply-To: <1464553543-19091-1-git-send-email-ykaneko0929@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 05/29/2016 11:25 PM, Yoshihiro Kaneko wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>
> Use SET_RUNTIME_PM_OPS macro instead of assigning a member of
> dev_pm_ops directly.
>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
