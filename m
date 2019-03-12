Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E335C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AAE8214AF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dLnZMrhO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfCLM5n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:57:43 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33261 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfCLM5i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:57:38 -0400
Received: by mail-qt1-f195.google.com with SMTP id z39so2381646qtz.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YBGRxC4QbiOFgyiLFX4Vz7OhrD+A0YQqRwbAcsmrXek=;
        b=dLnZMrhO7gHWiClN96ndy6o2Iuw9mMGQlzmhtva+iO99UezdOS56Nvyj+qOVkHB9M+
         mYZsnDlyNfgn9luawypNwY2ReA7V4dhWZ6Xyxka0y+5PuHf35/aLC9dbGYRvlX7zVgIi
         L+y6zmGGH/R7SN0z0g/wNVO5aAbnS31SWTLzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YBGRxC4QbiOFgyiLFX4Vz7OhrD+A0YQqRwbAcsmrXek=;
        b=S091Ja4VxNOpYDwIFd5UnZspQKndUsN5bAAg3LLytDcyOzlHEWE0pQHYVYJ92Fib2X
         9nA0SyoO6P5SzeVskANNxxiGLy7dIz/WZqBKk4WvOZmJKQrM2FY28xNfNeN45wLg8kA5
         zoQa8c4woTpha2K8mJ4JkC5C9Qrgxg58Ch8kcyc8kRt2Xb46M33FdQzuMTEJDMoBzZW/
         4tgDWpVwj18aX9+P4oNxEPXnzE8DpNRp7Z7CHI9DuQSc+Q3WN0S2uK1gL8BpJ7XR6sf5
         OuPl2A5L3HRtRNIe9RLV2bkZZCjgkqgg4EIq1iU7Du5KmFBUrNbj29kxUiwu3oj4vUN+
         u39w==
X-Gm-Message-State: APjAAAU3cmRtGsV5IZTcvkOJtgZyCvw7Wlrr9O58LgWLK/vt4cMKHuxz
        YYYtH+GPs3gZgxh+I6qhKLpXa2BAEYMjlpHes/VKUw==
X-Google-Smtp-Source: APXvYqymSyOE8aMcznzN5J+RB4XicATuFgesiH9vlCzXIlL1DGUCC1A0ycIFxVYy0cZ98SYD/7Y6POUo1tnDXTiB3ME=
X-Received: by 2002:ac8:7550:: with SMTP id b16mr9342287qtr.307.1552395457294;
 Tue, 12 Mar 2019 05:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190312124442.10098-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190312124442.10098-1-wsa+renesas@sang-engineering.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 12 Mar 2019 20:57:26 +0800
Message-ID: <CAJMQK-gRyApvqb3Bqtks0=uXF+XFN5fkQnmzsy5uBZJFJQC6rQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: add extra check to safe DMA buffer helper
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 12, 2019 at 8:44 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Make sure we report 'no buffer' for 0-length messages. This can only
> happen if threshold is set to 0 which is kind of bogus but we should
> still handle this situation. Update the docs and add a debug message
> to educate callers of this function.
>
> Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Fixes: e94bc5d18be0 ("i2c: add helpers to ease DMA handling")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Thanks!

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes since v1:
>         * add debug print
>         * update kernel doc
>         * update commit message
>
>  drivers/i2c/i2c-core-base.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index cb6c5cb0df0b..986e56cee44b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2258,7 +2258,8 @@ EXPORT_SYMBOL(i2c_put_adapter);
>  /**
>   * i2c_get_dma_safe_msg_buf() - get a DMA safe buffer for the given i2c_msg
>   * @msg: the message to be checked
> - * @threshold: the minimum number of bytes for which using DMA makes sense
> + * @threshold: the minimum number of bytes for which using DMA makes sense.
> + *            Should at least be 1.
>   *
>   * Return: NULL if a DMA safe buffer was not obtained. Use msg->buf with PIO.
>   *        Or a valid pointer to be used with DMA. After use, release it by
> @@ -2268,7 +2269,11 @@ EXPORT_SYMBOL(i2c_put_adapter);
>   */
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold)
>  {
> -       if (msg->len < threshold)
> +       /* also skip 0-length msgs for bogus thresholds of 0 */
> +       if (!threshold)
> +               pr_debug("DMA buffer for addr=0x%02x with length 0 is bogus\n",
> +                        msg->addr);
> +       if (msg->len < threshold || msg->len == 0)
>                 return NULL;
>
>         if (msg->flags & I2C_M_DMA_SAFE)
> --
> 2.11.0
>
