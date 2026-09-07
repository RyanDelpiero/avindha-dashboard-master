const { PrismaClient } = require('@prisma/client');

// Mencegah pembuatan multiple prisma client saat serverless cold start
const globalForPrisma = global;
const prisma = globalForPrisma.prisma || new PrismaClient();
if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma;