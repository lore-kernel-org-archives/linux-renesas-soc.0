Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35520 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757884AbcGKHwk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 03:52:40 -0400
Received: by mail-oi0-f52.google.com with SMTP id r2so136726141oih.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2016 00:52:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
References: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2016 09:52:39 +0200
Message-ID: <CACRpkdYZ9Q3AmpWognxHmqJ9X1VbhSLcn9+Oiq1Ja4pBZZtXiw@mail.gmail.com>
Subject: Re: [PATCH -next] sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
To: weiyj_lk@163.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 6, 2016 at 2:03 PM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied with Laurent's ACK.

(Not expecting Geert to collect patches for me this late in the merge
cycle.)

Yours,
Linus Walleij
