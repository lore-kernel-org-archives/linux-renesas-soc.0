Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE015C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 06:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 972292084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 06:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="dvZmlJI1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfDAGGR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 02:06:17 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:51752 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfDAGGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 02:06:17 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44Xhft2sT7z1XLFjJ;
        Mon,  1 Apr 2019 08:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1554098774;
        bh=y2b7Vc4S9Xj0saASRHX0tCniXUHjUyfcXNFDmB3dM3k=; l=10;
        h=From:From:Reply-To:Sender;
        b=dvZmlJI11nGGbWM4Tl04UxGGUN7/LOzZEI3+Sq/Mo1mCQxCcmKN/OtQjQwFgQrBS1
         cODbROIZKLwWe/+k9Ira/+en9NQOBsMPvwiwYE1TtbGIG/TLi7FnGRpIPxruExuuqa
         6X0oK7f5oGkxmMqWwRFL9Jjt2gVRBwNKKAEOJCPI=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44Xhft2WTXz1WN;
        Mon,  1 Apr 2019 08:06:14 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-78-5ca1aa56ec43
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id FB.B8.32648.65AA1AC5; Mon,  1 Apr 2019 08:06:14 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 44Xhft0JMJz524;
        Mon,  1 Apr 2019 08:06:14 +0200 (CEST)
Received: from [10.34.221.161] (10.34.221.161) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1713.5; Mon, 1 Apr 2019
 08:06:13 +0200
Subject: Re: [PATCH] serial: sh-sci: Fix HSCIF RX sampling point adjustment
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-serial@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20190329091026.18958-1-geert+renesas@glider.be>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <7ad048ba-75b4-538a-b084-a2ad3875978f@de.bosch.com>
Date:   Mon, 1 Apr 2019 08:06:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190329091026.18958-1-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA21Te0xTZxzl6720t7VXL7dAfyuwR7NH4kIHOOeddq8sMRUStyzLskd9lHEp
        VVqa3paAZhkEptANQQU26miLCHSFDexAaHzMNMNVAs4ZHQGZZMt0gg6cWrdhhN22IP1j//2+
        c37nnO87N5fAaDehIAwmK2sx6QqVQgkuWf91Wvo73hZthq9xBeNdqBQwzYcOIKaitVvI1Pfc
        EjB9UzMCZri1RsTU1L/wqkjj2Nsp0uwfSdf4Hb+INN81d4k03b2XcM0d36NvCt+XqPPYQkMx
        a3nu5e2SgqaGYdwcIEruVXNl6DehHYkJoJ6HrrYOUXimqb0C6Aym2pGEn08gKDveLYge2hF4
        797HwlsyKgf2jX8fIRIpH4ITV5pQmMAoMwQbJ4RRKzX0BWfw8CykVoO/rioSsYpSgfvUSHx4
        JqlXIFTlj+zg1JPg8h2MaJMoLQQbekXRnQQ42/R7ZEdMvQR9J1vio1kMNLl+XMyVg+/a34v4
        Y9D/55dY9GlPQMPlT/E6JHPEWDli5I4YuSNG7ka4FyXlsxnFxnUvZjIqSy7L7crIVH1YZPSh
        6GeiBpB/KD+AKAIppSTV3KKl43XFXKkxgNYSAmUSeTaXh1bmFuWVFui4gm0WWyHLKRVk6vls
        LS17CHO2XKOB4wxFpgACAlMmksO1bi1N5ulKd7GWoqgsgFIIXCkn9cQbWprS66zsTpY1s5Yl
        dgNBKIF828MHJlhYPVuSbyi0LtHKNBLFxcXRybFMbKyAEAfQGkLKZ7eFLUjOrDNyBv2i/JGo
        nF5Cl6VDaBMxG/q1GSPcY3NOjMZNRSZWIScbwy5UeL/AZnp4D0UqGXfVqaWTYohlr2k0ifgm
        ZeTjHbxYyv8TyzcAMiVcWsIiuCzK6uQ11D8YOAdCCD4ZrcMhZHetAM/R+wlw8EGPCqp7ezLg
        YlttFoQ8P2fB0XtH1sORseYNcP3uvBpcF0begnHn7ffAear8A7jZObcV/v3pm21QX35LB8Hr
        7fmwMO82wMToVwaYPDayE5zH7IW882kbXBy8XQKTY2c+Au9C7cdQfmX0MwRXhytqETjnbxxA
        MFM99TkCT9WsE8Gs/Uw7muZLFvAlMzZXuGSrzvo/JS+iy29UlKHNXwjmxqZXil/rSFnjn97i
        3pO8vdHxV2Xocs6ANBHb86292DM42Fr5R9dGleSk7NzmnPTdHqlD+u5T1A8z8t37T+vzt7ae
        J7DkwxMtWUzuuv60mht3qkuzDz+T/brt3Oz4+NTTOTsmzPTaaxXpD3ovbDme/KzcOeTqp/dt
        uqRW7xDfVOJcgS5zNWbhdP8BBHocBLMEAAA=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29.03.2019 10:10, Geert Uytterhoeven wrote:
> The calculation of the sampling point has min() and max() exchanged.
> Fix this by using the clamp() helper instead.
> 
> Fixes: 63ba1e00f178a448 ("serial: sh-sci: Support for HSCIF RX sampling point adjustment")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Dirk Behme <dirk.behme@de.bosch.com>

> ---
>   drivers/tty/serial/sh-sci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 060fcd42b6d56010..2bdaeba5d527a6ce 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2529,7 +2529,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>   				 * last stop bit; we can increase the error
>   				 * margin by shifting the sampling point.
>   				 */
> -				int shift = min(-8, max(7, deviation / 2));
> +				int shift = clamp(deviation / 2, -8, 7);
>   
>   				hssrr |= (shift << HSCIF_SRHP_SHIFT) &
>   					 HSCIF_SRHP_MASK;
> 
