Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34730 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754376AbcFAQxk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 12:53:40 -0400
Received: by mail-lf0-f45.google.com with SMTP id k98so17051286lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jun 2016 09:53:39 -0700 (PDT)
Subject: Re: [PATCH net-next] ravb: Remove manual pause frame transmit
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, netdev@vger.kernel.org
References: <1464799265-27431-1-git-send-email-ykaneko0929@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e9552754-81e2-e39d-3218-8988826cb212@cogentembedded.com>
Date: Wed, 1 Jun 2016 19:53:35 +0300
MIME-Version: 1.0
In-Reply-To: <1464799265-27431-1-git-send-email-ykaneko0929@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 06/01/2016 07:41 PM, Yoshihiro Kaneko wrote:

> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>
> Writing a non-zero value to the manual PAUSE frame register (MPR) starts
> the transmission of a PAUSE frame.
> A PAUSE frame is sent in ravb_emac_init(), but it is not expected behavior.
>
> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
