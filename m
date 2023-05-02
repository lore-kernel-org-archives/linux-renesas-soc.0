Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED931C77B73
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 May 2023 10:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbjEBKgp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 May 2023 06:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbjEBKgA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 06:36:00 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7165B90
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 May 2023 03:35:41 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so24116965276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2023 03:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023741; x=1685615741;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXBCQfzhmt+vVpn5XDbII3We6EY10VoCIWZYwiBToeI=;
        b=TY6HN5FUn71eBV+omp3OeWzDXjntiuONxtEs6bVM6nQ49R2WjYnLATg8WWQuh4+LP0
         FMftLvxwAz6kWJJpYAleZ7rWoSVRr9O3LBtC1p/u4qjjzg5sAOzFH+woqBQ3R6r/0vmK
         7iIS/NFqODWHzJBGqDmMfXs8nKe/oHc9cgbIPRPUDLfXJV14rZuCNxB3IxZQ70tWTUew
         D4klPAHXl4YfzUBzV2rt6QUeu6gGCpBp4IZWJKhB4W0crIAY7ZXNe7JbjU4jcFFdUIK6
         ABhUex8R/9oi5KgyH5FNEVGescqntcr5P0/wAYpWIapJxxou2bkKLgv+YLlTClqr8K16
         FeFA==
X-Gm-Message-State: AC+VfDxUA8/C1rAx1pbWSpyQOWN1bhkW5v+kKzedaEN7kAAo7+qALGHZ
        OlKAi17KP3TG2rVPERkMElKoUfyTPM776g==
X-Google-Smtp-Source: ACHHUZ6ld3d9qTylqyGZvh7BWA7HShJHu08Ib590jLDKdlTDrJdy1SyrUP/d75oF7/wpGk+9xng1gg==
X-Received: by 2002:a25:dcf:0:b0:b9e:7dd0:e9bc with SMTP id 198-20020a250dcf000000b00b9e7dd0e9bcmr701105ybn.4.1683023740694;
        Tue, 02 May 2023 03:35:40 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id x6-20020a25b906000000b00b99cfb2ab6esm4505060ybj.18.2023.05.02.03.35.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:35:40 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so24116897276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2023 03:35:40 -0700 (PDT)
X-Received: by 2002:a25:4d8a:0:b0:b9a:867b:462a with SMTP id
 a132-20020a254d8a000000b00b9a867b462amr13847489ybb.7.1683023740001; Tue, 02
 May 2023 03:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com> <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
In-Reply-To: <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 May 2023 12:35:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
Message-ID: <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 11, 2023 at 12:50 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>   - renesas-drivers-2023-04-25-v6.3 (TBD),
>   - renesas-drivers-2023-05-02-v6.3 (TBD).

So that became the former.

Next planned releases, if all goes well:
  - renesas-drivers-2023-05-09-v6.4-rc1,
  - renesas-drivers-2023-05-23-v6.4-rc3,
  - renesas-drivers-2023-06-06-v6.4-rc5,
  - renesas-drivers-2023-06-20-v6.4-rc7,
  - renesas-drivers-2023-06-27-v6.4 (TBD, oops during EOSS),
  - renesas-drivers-2023-07-04-v6.4 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
