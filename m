Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34443 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdAXQar (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 11:30:47 -0500
Received: by mail-vk0-f67.google.com with SMTP id r136so14203312vke.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 08:30:41 -0800 (PST)
MIME-Version: 1.0
From: Stuvart S <lovelinuxdeeply@gmail.com>
Date: Tue, 24 Jan 2017 22:00:35 +0530
Message-ID: <CAAMGra7m8RGFegDu6on=_vCZvUBLut7sWDhCxTs5PgUCaLEJcQ@mail.gmail.com>
Subject: About DU DRM
To: linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent and all,

       I am tracking complete files of DU in my source tree linux 4.9
one by one .I know it is not an easy task to study completely  but now
it is really interesting for me..

first of all I am saying my ultimate goal here,I want to get track the
 whole route of
image/video data until it reaches to final output (Display) ..till now
I understand the flow as below

FRAME BUFFER ----> CRTC ------> ENCODER ------>CONNECTOR----->DISPLAY

By familiarizing DRM I got following knowledge,

mainly DRM has its Core(Generic ) and Driver(Specific)..for both of
these there are different ioctls. and in the first case most of the
ioctls are wrapped through libdrm functions for easiness ..

hopping suggestions if I am in wrong path..

On the other side, I think driver dependent APIs will be there right?

How various graphics drivers will communicate to DRM?
In my limited knowledge, DRM is purely software centric right? so the
communication will be through some APIs I think..

expecting a helping hand

-- 
                        --- Come    Let's enjoy the world of Open Source  ---


Best regards,
Stuvart
