Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D039768F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909109; cv=pass; b=kudpnT5p+wkP+X5TaWSeQIyZzcIZmFD4gV72AQ0GBsieHxRxnD5FYgCujlyRYf0YTwg1jvLu73R1/21nXmz93vPlP2CXgqPoTWJ8EMDJNfBFLkfITXlRT0l14+tc+e3O6/25cDul6IYwyaISnsLs4cmYfNCe7bB5FUt8rz5FSpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909109; c=relaxed/simple;
	bh=dz0SOWNhcfrldhH+lMj9uKn/k/LmiSfJchEiB6WaWBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnnSRWJb++3oCcCnWq6Tf+H6mNXaQbz9ozTTg4vgsjEptUBRdGyiyfH5VWInTb5rJd5XnqxZP/i2bSs2r8VVHrC5xAC1v7H2YdUoQy/y3xuqU0jNvuG6FzLWsuy1uSZpB1x0ZIiwHEPRmNBghWkvC4t1E+h8t3OEb6WxQabNqvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYBzgulp; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYBzgulp"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4e729368fso836835a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 02:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909106; cv=none;
        d=google.com; s=arc-20260327;
        b=s+MPKJ1omJEOuGSHnjy7vKOXivECwXaKiSlAgKDOfUSWGqHEvR9eQFWVUwpHWKCen3
         xa+qG1KsiXjs1aqA6SomsfDtTXrH85BwMhvTla2MS1oEOvSePOXWpiKtTGUNgYFBzvmO
         +mGTi9Qkh8351OD9nhh86XUBnj0ny5NbKCiW90ahs/LCT9+qBXvYg9IMGMHpTMeWR6T8
         70BNi8qO44jUfajxo2Pdrw0EX694DW+jou3bVH2rP9vqZXws1B6X17gRQPIg5bzqlhug
         pJaQzESBcl+TH3e8dwgUPDRTEeIXjJbwKsDqsVVTRqYgkdzkPRYLlv0kLyQ21DHLVuMQ
         atpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Imb5kMkVgWrmaN3qHbaWEYz34ASz+yu7tv+BXjiGe0o=;
        fh=dHyiYyg0QcC/WSw1b6VBLxHTNF+VLrKtlvt2OcSQ8oo=;
        b=nOPLA/fQolsilexGdLmuMJw8M/a97TP/LvYrzp8VnqTb2Qn3kxnXYYknE4iVa9xtqr
         wC/v9OzXUYM/ZLdcJ6mfoCOHpkc7nw19xXlER67e2Mn7JC7svJinXueKnBSe40IGbDfd
         k8EpCGcJbb6evYU6u9FEXQpbRKCeFKkV3mMprKJ7GEXnZ8jgFOeeDM6FOacQCMOzi4sa
         deptHTgxrZwjl28wJ/wd+1O+iBVu3MMvplxyfW2qa1eLEpokberWMnau+J+lfu0w2Mdh
         VR3gd3uBKA6ZzQeC18aMn2jP+ao1Hzu3OqoSIK4++TXi3G1uwHDN51C/h5ofYAlYtqlB
         MirA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909106; x=1788513906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imb5kMkVgWrmaN3qHbaWEYz34ASz+yu7tv+BXjiGe0o=;
        b=AYBzgulp9ecpmQCDbBTFfCGl/YnPDMNurviBK52WHAMse5QI01cXuXLjQZlOdlyzDE
         LsCykAm4i96Mw03BZysGG5m9QwgElgOiXnSQHX2O1aWwCvcyqrk74l+4lVUmz47DQscV
         72hodPvc3L0rMsn8vPXUmsMMKH+ycEx0/+t+7AKuN192f3OBqABQMF+AQFonIiABoIqU
         I5lL/ihjurtqe20jPs37aCGUuM8EdBc03C77PMh48Zs8grbmqmhtV7tmFbTeu41ne4E3
         WtZJAkCq2eFP+jVKw3w0iHIA25L3k5mhCf32T0pK/zuGiRLh5157zUDE1OupmbfR53vr
         jrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909106; x=1788513906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Imb5kMkVgWrmaN3qHbaWEYz34ASz+yu7tv+BXjiGe0o=;
        b=sozN9SOnQtk7z4czyAxW/RmnWaVRHJnFbEtZlbk6bjfGjUocL6jM/uf9Z4r5idrfK4
         Cz6WFNu+kyZEHf9F7GKVNFi0Sn1uUyrKIG2dlPAq/sNpz3uNSw54z7aN19NFYLoIAnbt
         h5fyESmFXvJaLSP2anu4MKEU8RZFxbEvndAfbZuAhQ+oVDOX0bblLNmxdKBP47WDFaBq
         PdmnueGgvX+dJy6no+/Wd3lrf+qmnyRPP2H37vOZnkN7MuFE6SsoN22rgtNL/0oaD8hP
         Bt812r11X9TfyY5KUfvUVdpVWDzbVQlFWjWyZUymAFrr5ov4mjGQgRDiGbaOoSkdNk3M
         9BJw==
X-Forwarded-Encrypted: i=1; AHgh+RpXkKRU7eIKIm6u2bDMbL7SXtyNGyepRs1v2yZEt99INiOZOR/w3/jZb2iIWDS0SdNqMe+xzlr24eC289ADnNEI9A==@vger.kernel.org
X-Gm-Message-State: AFuF++lRCzqChrfp1eQ3aSaFilxoFBb7FLkL+MIajLYwjK83p/BmMn59
	Of1R21EksXLO17ric8tDCeHZ1kQXX3JLI48lDt9C6m2cwA5q4chX4esih1H3wi6Zpd3TcROsUVo
	did9+cEpQPPf+Zj5N4aV90xpQX+kZN3I=
X-Gm-Gg: AR+sD11OCfvG3M8/WaGNyjBb6TYyZDmLS9gTEdIpXwdWHEX8oJGgpSHLzEPiTd6UvvM
	qpq7ebG25NJG6Nm5kC+PUM/isqH5evBWYDJs8C39Jew2imyaTO4aN7Y/N2d5DFA1Qtkol9UbopH
	rC1FUrQf4yYIQ4oKeG7JZgFvZfI2HwI7PluZ5robaelgDiooFpxwrJUTXAI6hKvAPFBBP+OHyD6
	jc/RE0lpcTMFYQckPy2b1Lukmv+GHVCIIdwCeJV6ngU3W1etPoZz5Qx6kjIzWmbGRWyj/TxHoNm
	h7EYWbhxWn/biPYT2men4S4Y49aIAD3227/tjDJpjsFytqHGIEznfVuUTZMzU0wYRf5ralmzTGn
	w1/I3+UVNW/jWuK5l/UWVVH07TVyvshQI2T8=
X-Received: by 2002:a05:6830:67f8:b0:7dc:e37b:b5d3 with SMTP id
 46e09a7af769-7f4f227d276mr8198335a34.7.1787909105673; Fri, 28 Aug 2026
 02:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828071123.179670-1-dayou5941@163.com>
In-Reply-To: <20260828071123.179670-1-dayou5941@163.com>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Fri, 28 Aug 2026 14:54:54 +0530
X-Gm-Features: AcwNN1US7WSfZ25oq7-XBcJ8hx7fgmGhS9ze9BWZ_-55L1Fbw-jjvhmGdcF6m5U
Message-ID: <CAFqz8L+TjFmnKpJtChJA6c3O0TJv_O=A9Lb5bdzbVQTeFHg8BA@mail.gmail.com>
Subject: Re: [PATCH] counter: rz-mtu3-cnt: check clk_prepare_enable() return value
To: Li Youhong <dayou5941@163.com>
Cc: biju.das.jz@bp.renesas.com, wbg@kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 28, 2026 at 12:46 PM Li Youhong <dayou5941@163.com> wrote:
>
> From: Li Youhong <liyouhong@kylinos.cn>
>
> The driver ignored clk_prepare_enable() failures during probe and
> runtime resume.  Propagate the error so probe does not continue with
> the clock disabled and resume does not report success falsely.
>
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> ---

This is a bug fix, so I think it should carry a Fixes: tag. Both call
sites look like they date back to the original driver.

Thanks,
Vidhu
