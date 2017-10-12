Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:46190 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751759AbdJLVJU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 17:09:20 -0400
Received: by mail-lf0-f53.google.com with SMTP id g70so7367259lfl.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2017 14:09:19 -0700 (PDT)
Subject: Re: [PATCH 1/1] gpio-rcar: use devm_ioremap_resource()
To: Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <20171012210818.806395567@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c497c532-765c-e90f-b0ea-76df1c4ddf91@cogentembedded.com>
Date: Fri, 13 Oct 2017 00:09:16 +0300
MIME-Version: 1.0
In-Reply-To: <20171012210818.806395567@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sorry for (unintended) patch dupe... :-<
