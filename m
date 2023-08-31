Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DDC83F37
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Aug 2023 17:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbjHaRdX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 31 Aug 2023 13:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346694AbjHaRdW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 13:33:22 -0400
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6176010D3;
        Thu, 31 Aug 2023 10:33:08 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5717f7b932aso675133eaf.0;
        Thu, 31 Aug 2023 10:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693503187; x=1694107987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euRoGwF/bHtDRN49l+2MpHP1k9U7h0kuDLoOSY2LpqY=;
        b=jPX9qeaiwqz/O2sdCaZqeBiSfXAI/caeZt3Le1XfMzPgmtKQCs7td9Qi+8iJH1ywS7
         nTn2rfcpb7SUf3dMrcDs0PvnCCohs1+QYr/1yTUWPV153QnGTBgd3rsbXbMjqtG2WZJv
         nqYmhgPt6akDDEHjHwq7XrMctv3+2qho5tK+I5WhvoDSZ1Eu7ThTxyddS7tC1wJqxIa3
         ErWnFQPD5Gz4EB+4rGttYs12lIbWohjQEHQgYHENRyQnQUcTWXNGn/wSNuA972ZWhcj/
         mmEg3rnpN/jGiR4HeHt8oJEuSWvJs8wT610cYnnzC89rjR9RSv5ix74cTqbbTYU4RwxK
         isdQ==
X-Gm-Message-State: AOJu0YwkEj93IZ9563GyytZblYaOLsGASDrUpPdoOrrkLkOM+EOiR5Ty
        h00hxiyX3sDaomIgfBBOnVVgSSdltkA9jQ==
X-Google-Smtp-Source: AGHT+IGIJTLstwbjvZv8rHMdDeQusjtWWwEneeNXddELe25COIsJnU0/rFbyj8aE1+UGeq3XhpY8ZQ==
X-Received: by 2002:a05:6358:5293:b0:13a:6748:9312 with SMTP id g19-20020a056358529300b0013a67489312mr7651757rwa.19.1693503187493;
        Thu, 31 Aug 2023 10:33:07 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id v1-20020a25ab81000000b00d749a394c87sm438662ybi.16.2023.08.31.10.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 10:33:06 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7ba4c5f581so844498276.0;
        Thu, 31 Aug 2023 10:33:06 -0700 (PDT)
X-Received: by 2002:a25:8206:0:b0:d78:21e0:c06d with SMTP id
 q6-20020a258206000000b00d7821e0c06dmr315801ybk.64.1693503186636; Thu, 31 Aug
 2023 10:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com> <20230831063635.2816-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831063635.2816-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 19:32:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk56UX_Wd_997Rr3xZsKNcZZtiEY2Rmr5+=1Y3-Ky0Zw@mail.gmail.com>
Message-ID: <CAMuHMdUk56UX_Wd_997Rr3xZsKNcZZtiEY2Rmr5+=1Y3-Ky0Zw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: rzg2lc-smarc-som: Enable
 4-bit tx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 31, 2023 at 8:36 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable 4-bit tx support for sbc node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
