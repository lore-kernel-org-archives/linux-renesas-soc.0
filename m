Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC48C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 04:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E0622075C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 04:11:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cPxJUlGS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbfCKELQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 00:11:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37487 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfCKELQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 00:11:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id z17so3636162qtn.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2019 21:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=joq3GQmjr/p2N8d9NODLAGPhw9EgOtXTZb1UJbvlyss=;
        b=cPxJUlGSbCZFzzWimPhUZlAmZvBjQE5c+7jhGo+c+wqAzbTcTUjx9bTQyj+8ttd9wH
         +Y0OIz9ilwAvv/NzrrvM00n7njHYzOc7PWGFGq45fWkZU6Jye9kafWskiQFG1kv11CMI
         ghmHj36lO4ejYJUQSeVRDPZ0o+IbBY3JoZIB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=joq3GQmjr/p2N8d9NODLAGPhw9EgOtXTZb1UJbvlyss=;
        b=edzVQXTxEd1mhHt1EJU/RayVREY6R9mb9XUGkzli8p5LzP9cM+iB4lCfvA1XLCAPXy
         BBHUesEi8RRif3NLi4q8/1PwVoy6bQUrv6pgz2q0P85n2vIzSN5eAbvQSVvhWZZetR9f
         s0FGdCbxstChND9t2RdSQkc6Vz3+zDWysIXp9FSUlWTJqgYgOxgJpisTmQoaeFzczuIt
         JKDV7Wk1RQ9C5paNGUQXwm2aYZHlqm1GJkOGOyc8hgd7wSGydEpXfNkzGz23XLiedplp
         5pIBubPtFq611aQBWpId2nmb4FcIdfpDtVe89bQRJMxZKO7LhA8bgW6pgVUb3gf+/CSJ
         SZug==
X-Gm-Message-State: APjAAAWmBbSSt1WXLe+NDa9o7zLj/Ci83hEQOU97YHhJqacw5JkMh53U
        iPqjkpUN0JABBS3KGxT+lnNTErf4B2qM/3w/CsvfOEmErBE=
X-Google-Smtp-Source: APXvYqzS5h/N+p72OxXWNMDQgu4/ifSA2UmVRGcaXVeDvV4hg+6ZaE1SvMwkKnc4kWV3L73KaAe7jn0n9BUDvK+yAdo=
X-Received: by 2002:ac8:3258:: with SMTP id y24mr722295qta.0.1552277475305;
 Sun, 10 Mar 2019 21:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 11 Mar 2019 12:11:04 +0800
Message-ID: <CAJMQK-iDbBhD95Dweq2q8cMpJ65RCKUTzm8CLTYms6BxpqADXQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: add extra check to safe DMA buffer helper
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Mar 9, 2019 at 6:54 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Make sure we report no buffer for 0-length messages. This can only
> happen if threshold is set to 0 which is kind of bogus but we should
> handle this situation nonetheless.
>
> Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Fixes: e94bc5d18be0 ("i2c: add helpers to ease DMA handling")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index cb6c5cb0df0b..22c8f38bf68c 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2268,7 +2268,8 @@ EXPORT_SYMBOL(i2c_put_adapter);
>   */
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold)
>  {

How about also printing some warning if threshold is zero? Since
caller might expect
that if msg->len >= threshold, they will get valid pointer. But they
will get valid pointer
if (msg->len, threshold) is (>0, 0) and NULL if (=0, 0). So warn them
that the threshold
is bogus.

> -       if (msg->len < threshold)
> +       /* also skip 0-length msgs for bogus thresholds of 0 */
> +       if (msg->len < threshold || msg->len == 0)
>                 return NULL;
>
>         if (msg->flags & I2C_M_DMA_SAFE)
> --
> 2.19.1
>
